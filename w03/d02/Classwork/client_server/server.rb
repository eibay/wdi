require 'socket'

server = TCPServer.new 2000
client = server.accept
puts client.gets

client.puts File.read('./index.html')
client.close
































