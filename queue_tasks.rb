require_relative 'bundle/bundler/setup'
require 'iron_mq'
require 'iron_worker'

mq = IronMQ::Client.new
q = mq.queue("queueA")
200.times do |i|
  puts "queuing msg #{i}"
  p q.post({'hello' => 'world'}.to_json)
  sleep 1
end
