require 'socket'
require 'json'
require 'pry'
require 'httparty'

server = TCPServer.new 2000

while true
	client = server.accept
	client_ip = client.remote_address.ip_address #server log
	puts "#{Time.now}- Client connected from #{client_ip}!"
	
	request = client.gets.chomp
	path = request.split(" ")[1]
	puts "#{Time.now}- Client connected from #{client_ip} is attempting to reach #{path}."

end

music_api = TCPSocket.new 'https://musicbrainz.org/', 80
