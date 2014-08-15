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
	puts "#{Time.now}- Client connected from #{client_ip} is attempting to reach #{path}" #server log

# http://127.0.0.1:2000/movies/rocky
# path.split('/')
# [0] " "
# [1] "movies",
# [2] "inception",

if path.split('/')[1] == "movies" #movies is just a string
	movie_title = path.split('/')[2] #the movie title, in this case it would be inception
	
	omdb_api = TCPSocket.new 'www.omdbapi.com', 80
	omdb_api.puts "GET /?t=#{movie_title}"

	puts "#{Time.now} Connecting to OMDB" #server log 

	json_response = omdb_api.gets.chomp
	parsed_response = JSON.parse(json_response)

	omdb_api.close
	puts "#{Time.now} Disconnecting from OMDB" #server log

	client.puts parsed_response

end
puts "#{Time.now} - client #{client_ip} has disconntected" #server log
client.close

end