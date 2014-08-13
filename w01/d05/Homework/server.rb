require 'socket'
require 'pry'

server = TCPServer.new 2000
	puts "Client has c"
while true
	
	client = server.accept
	client_ip = client.remote_address.ip_address

	puts "Client has connected from #{client_ip}"

	request = client.gets.chomp

	binding.pry

	client.close


end