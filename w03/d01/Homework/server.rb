require 'socket'
require 'json'
require 'httparty'
require 'pry'

server = TCPServer.new 2000

loop  do

	client = server.accept
	client_ip = client.remote_address.ip_address
	
	puts "Client has connected from #{client_ip}"

	request = client.gets.chomp

	path = request.split(' ')[1]
	puts "#{Time.now} - Client #{client_ip} is attempting to reach #{path}"

	if path == "/"
		html = File.read('./views/index.html')
		client.puts html
	elsif path == "/style.css"	
		css = File.read('./stylesheets/style.css')
		client.puts css
	elsif path.split("=")[0] =="/words?specific_word"
		tag = path.split("=")[1]

		response = HTTParty.get("https://api.instagram.com/v1/tags/#{tag}/media/recent?client_id=40eb15cb18e94f7db90a3ee37208f21b")
		response = response["data"]

		images = []

		i = 0

		while i < response.length
			url = response[i]['images']['standard_resolution']['url']
			images << "<li><a href='#{url}'><img src='#{url}'></a></li>"
			i += 1
		end
	
		# response.each { |something|

		# 	images << "<li><img src='something['images']['standard_resolution']['url']'></li>"
		# 	binding.pry
		# }

		images = images.join(' ')

		html = File.read('./views/images.html')
		html = html.gsub("{{tag}}", "#{tag}")
		html = html.gsub("{{images}}", images)
		client.puts html

	end
		client.close
end












