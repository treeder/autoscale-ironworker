require_relative 'bundle/bundler/setup'
require 'iron_mq'

mq = IronMQ::Client.new
q = mq.queue("queueA")

while (msg = q.reserve) != nil
  puts "get msg"
  p msg.body
  sleep 5
  msg.delete
end
