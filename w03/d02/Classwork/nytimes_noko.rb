require 'nokogiri'
require 'open-uri'
require 'socket'
require 'cgi'

server=TCPServer.new 2000

doc=Nokogiri::HTML(open("http://nytimes.com"))
loop do
	client=server.accept
	client.gets

	doc.css("h2.story-heading a").each do |heading|

	replace=heading.content.split(" ")[1]

	if(replace)
		heading.content=heading.content.gsub(replace, "Conor")
	end

	end

	client.puts CGI.unescapeHTML(doc)

	client.close
end