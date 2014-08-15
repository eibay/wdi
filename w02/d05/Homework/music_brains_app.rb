require 'pry'
require 'json'
require 'httparty'

server = TCPServer.new 2000

while true
client = server.accept
client_ip = client.remote_address.ip_address
puts "#{Time.now} - client connected from #{client_ip}"

request = client.gets.chomp
path = request.split(" ")[1]
puts "#{Time.now} - client is requesting #{path}"


api = TCPSocket.new "" 80





end