require 'json'
require 'pry'
require 'socket'

server = TCPServer.new 2000

loop do

	client = server.accept
	puts "#{Time.now} - Client has connected"

	request = client.gets.chomp
	path = request.split[1]
	puts "#{Time.now} - Client has requested #{path}"

	movie = path.split("/")[1]
	unless movie.include?("favicon")
		movie_api = TCPSocket.new('www.omdbapi.com', 80)
		puts "#{Time.now} - Connected to OMDBAPI"

	
		movie_api.puts "GET /?t=" + movie
		puts "#{Time.now} - Requested #{path} from OMDBAPI"


		response = movie_api.gets.chomp
		puts "#{Time.now} - Received content from OMDBAPI"

		movie_api.close
		puts "#{Time.now} - Disconnected from OMDBAPI"

		parsed_response = JSON.parse(response)

		if parsed_response["Response"] == "False"
			client.puts "Did not find"
		else
			client.puts "<p><center>#{parsed_response['Plot']}</center></p>"
			puts "#{Time.now} - Sent content to Client"
		end
	end

	response = nil
	client.close
	puts "#{Time.now} - Client disconnected"

end