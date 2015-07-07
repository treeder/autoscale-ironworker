require_relative 'bundle/bundler/setup'
require 'iron_mq'
require 'iron_worker'
require 'iron_cache'

ic = IronCache::Client.new
cache = ic.cache("autoscaling-cache")
imq = IronMQ::Client.new
iw = IronWorker::Client.new

scaledef = JSON.load(open('scale.json'))
# p scaledef

started_at = Time.now
end_at = started_at + (60 * 30) # 30 minutes
while Time.now < end_at
  scaledef['queues'].each do |qscale|
    p qscale
    qname = qscale['name']
    q = imq.queue(qname)
    qinfo = q.info
    # p qinfo
    qsize = qinfo['size']
    puts "queue size: #{qsize}"

    # Check queue size on last check
    cache_key = "queue-#{qname}"
    citem = cache.get(cache_key)
    if citem.nil?
      citem = {'size' => 0}
    else
      citem = JSON.parse(citem.value)
      puts "last check: "
      p citem
    end
    wname = qscale['worker']
    triggers = qscale['triggers']
    triggers.each do |trigger|
      launch = 0
      p trigger
      if trigger['type'] == 'fixed'
        if qsize >= trigger['trigger']
          if trigger['trigger'] <= citem['size']
            # Skip this since it would have been triggered last check
            next
          end
          # otherwise, this is being triggered
          launch = 1
        end
      else
        puts "progressive type"
        # type='progressive'
        # eg: progessive trigger of 50: if size >= 50, launch one, if >= 100, launch second one, etc.
        if qsize < trigger['trigger']
          # don't launch if size is less than initial level
          next
        end
        plevel = citem['size'] / trigger['trigger'] # eg: 101/50 = 2
        clevel = qsize / trigger['trigger']
        puts "plevel: #{plevel}, clevel: #{clevel}"
        if clevel > plevel
          launch = (clevel - plevel)
        end
      end
      if launch > 0
        puts "Launching #{launch} workers! queue size: #{qsize}, last check size #{citem['size']}, trigger: #{trigger}"
        launch.times do |li|
          puts "Launching #{li+1}..."
          iw.tasks.create(wname, {'size' => qsize}) # payload is optional
        end
      end
    end
    # Store current size back to cache
    citem['size'] = qsize
    cache.put(cache_key, citem.to_json)
  end
  STDOUT.flush
  sleep 30 # give it a rest
end
