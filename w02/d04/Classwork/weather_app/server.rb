# require 'socket'
# require 'pry'

# server = TCPServer.new 2000

# while true
# 	client = server.accept
# 	client_ip = client.remote_address.ip_address #server log
# 	puts "#{Time.now}- Client connected from #{client_ip}!"
# 	request = client.gets.chomp
# 	path = request.split(" ")[1]
# 	puts "#{Time.now}- Client connected from #{client_ip} is attempting to reach #{path}"

# if path == "/"
# 	client.puts "testing server"

# end

# puts "#{Time.now} - client #{client_ip} has disconntected" #server log
# client.close

# end

#template ^^^
##########################################################

require 'socket'
require 'pry'
require 'json'

server = TCPServer.new 2000

while true
	client = server.accept
	client_ip = client.remote_address.ip_address #server log
	puts "#{Time.now}- Client connected from #{client_ip}!"
	request = client.gets.chomp
	path = request.split(" ")[1]
	puts "#{Time.now}- Client connected from #{client_ip} is attempting to reach #{path}"

if path == "/"
	jeffs_api = TCPSocket.new '192.168.40.172', 8000 #what port I want to connect to
	jeffs_api.puts "GET /weather" 

	json_response = jeffs_api.gets.chomp #response is now in server, need to send to client
	parsed_response = JSON.prase(json_response)
	
	jeffs_api.close #need to close from GET /weather 

	client.puts "The temperature outside is #{parsed_response["weather"]} while the humidity is #{parsed_response["humidity]}" #sending respone too client

end

puts "#{Time.now} - client #{client_ip} has disconntected" #server log
client.close

end