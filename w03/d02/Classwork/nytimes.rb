require 'nokogiri'
require 'open-uri'
require 'socket'
require 'rainbow'
require 'pry'

server = TCPServer.new 2000

loop do 
	doc = Nokogiri::HTML(open('http://www.nytimes.com'))
		
	doc.css(".story-heading a").each do |link|
		if link.content.split(' ')[0] != nil
			link.content = link.content.gsub(link.content.split(' ')[0], "Eric") 
		end		
	end

	client = server.accept
	client_ip = client.remote_address.ip_address 
	puts Rainbow("Client connected from #{client_ip}").color("#fecb01")

	request = client.gets.chomp
	puts Rainbow("Client is requesting #{request}").color("#fecb01")

	path = request.split(' ')[1]

	if path == '/'
		client.puts doc
		puts Rainbow("Sent client nytimes").color("#fecb01")
	end

	client.close
	puts Rainbow("Client disconnected").color("#fecb01")

end