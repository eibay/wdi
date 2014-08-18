require 'pry'

require 'socket'

server = TCPServer.new 2000

puts "got to line 7"
client = server.accept
puts "got to line 9"

client.close