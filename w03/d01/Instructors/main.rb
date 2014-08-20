require 'pry'
require 'socket'

server = TCPServer.new 2000

loop do
	client = server.accept
	client.gets
	client.puts "hello"
	client.close
end