# require 'json'


# json = "{\"weather\":\"69 F\",\"humidity\":\"56%\",\"hash_crap\":true}\n"
# hash=JSON.parse(json)
# puts hash
# puts hash["weather"]
# puts hash["humidity"]
# puts hash["hash_crap"]
# puts hash.to_json
# puts "The current weather is #{hash['weather']} with a humidity of #{hash['humidity']}"
require 'socket'
require 'pry'
require 'rainbow/ext/string'
require 'json'

server=TCPServer.new 2000

while true
	client=server.accept
	client_ip= client.remote_address.ip_address
	puts "#{Time.now} has connected from #{client_ip}".color(:red)

	request=client.gets.chomp
	path=request.split(" ")[1]
	puts "#{Time.now}: Client #{client_ip} is attempting to connect from #{path}".color(:green)

	api=TCPSocket.new "http://omdbapi.com" , 80
		if(path=="/inception")
		api.puts "GET /?&t=Inception"

		puts"#{Time.now} :Connecting to OMDB".color(:magenta)

		response=api.gets
		response=JSON.parse(response)
		api.close
		puts "#{Time.now}: Disconnected from OMDB".color(:cyan)
		puts api





	end






	puts "#{Time.now}: Client #{client_ip} has disconnected".color(:blue)
	client.close


end
