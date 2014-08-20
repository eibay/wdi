require 'socket'
require 'webrick'
require 'pry'

server=TCPServer.new 2000


client=server.accept

client.gets

client.puts "Hello world"

client.close