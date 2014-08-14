require 'socket'
require 'pry'
require 'json'
require 'erb'

server = TCPServer.new 2000

while true

	client = server.accept
	client_ip = client.remote_address.ip_address

	# puts "#{Time.now} - Client has connected from #{client_ip}"

	request = client.gets.chomp
	path = request.split(' ')[1]
	# puts "#{Time.now} - Client #{client_ip} is attempting to reach #{path}"

	if path[0] == '/'
		if path[1,path.length] != '' # is there anything after '/'?
			search = path[1,path.length] # then it is a search term 
			# puts "#{Time.now} - Client may be trying to get info about #{search}" 

			omdb_api = TCPSocket.new 'www.omdbapi.com', 80
			omdb_api.puts "GET /?s=#{search}"

			# puts "#{Time.now} - Connecting to OMBD"

			json_response = omdb_api.gets.chomp
			parsed_response = JSON.parse(json_response)
			results = parsed_response["Search"] 

			# puts results 
			omdb_api.close
			# puts "#{Time.now} - Disconnected from OMBD"

			if parsed_response.include? "Error" 
				client.puts "<h1>Nope.</h1>" 
			else 
				f = File.read "./views/index.html.erb"
				e = ERB.new f 
				v = e.result binding 

				client.puts v 
			end 
			# puts "#{Time.now} - Sent movie info to client #{client_ip}"
		else 

			client.puts File.read("./views/index.html") 
		end 
	end 

	client.close
	# puts "#{Time.now} - Client #{client_ip} has disconnected"

end