require 'socket'
require 'uri'
require 'net/http'

server=TCPServer.new 2000


loop do

	client=server.accept
	request=client.gets
	path = request.split(" ")[1]
	if(path=="/")
		client.puts File.read("./testform.html")
	elsif(path=="/actions")
		puts "hey"
		url=URI.parse("http://127.0.0.1:2000/")
		params={"name" => "name"}
		res = Net::HTTP.post_form(url, params)
		
		# client.puts res.body
	end

	client.close
end
