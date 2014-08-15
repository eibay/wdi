require 'socket'
require 'pry'
require 'json'

server = TCPServer.new 2000

while true

client = server.accept
client_ip = client.remote_address.ip_address

puts "#{Time.now} - Client has connected from #{client_ip}"

request = client.gets.chomp
path = request.split(" ")[1]
puts "#{Time.now} - Client #{client_ip} is attempting to reach #{path}"

if path == "/"
	jeffs_api = TCPServer.new '192.168.40.172', 8000
	jeffs_api.puts "GET /weather"

	puts "#{Time.now} - Connecting to Jeff's Weather Server"

	json_response = jeffs_api.gets
	parsed_response = JSON.parse(json_response)

	jeffs_api.close
	puts "#{Time.now} - Disconnencted from Jeff's Weather Server"

	client.puts "The temperature outside is #{parsed_response["weather"]}, while the humidity is #{parsed_responce["humidity"]}. And alos, hash crap is #{parsed_response["hash_crap"]}"

	client.puts response

end	

puts "#{Time.now} - Client #{client_ip} has disconnected"
client.close

end