require 'webrick'
require 'socket'
require 'pry'
require 'httparty'

server = TCPServer.new 2000
tag = []
tag2 = []


loop do
	client = server.accept

	request = WEBrick::HTTPRequest.new(WEBrick::Config::HTTP)
	request.parse(client)

	if request.path == "/" && request.request_method == "GET"
		html = File.read("./views/index.html"	)
		client.puts html
	

	elsif request.path == "/tags" && request.request_method == "GET"
		tags = request.query["tag"]
		response = HTTParty.get("https://api.instagram.com/v1/tags/#{tags}/media/recent?client_id=f487e0636e6e44c396a32f49390219fe", headers: {"User-Agent" => "Httparty"})

		data_array = []
		response["data"].each do |a|
			data_array.push a["images"]
		end

		url_array =[]
		data_array.each do |b|
			url_array.push "<img src='" + b["low_resolution"]["url"] + "' alt =''>"
		end

		url_array2 = url_array.join('').to_s
		tagshtml = File.read('./views/tags.html')
		tagshtml = tagshtml.gsub('{{image}}', url_array2 )
		tagshtml = tagshtml.gsub('{{tag}}', tags)
		client.puts tagshtml

	elsif request.path == '/tags' && request.request_method == "POST"
		tag_2 = request.body.split("=")[0]
		tag2.push(tag_2)
		
		tag_str = tag2.join(", ")
		tags2html = File.read('./views/tags2.html')
		tags2html = tags2html.gsub('{{tag2}}', tag_str)

		tag3 = []
		tag2.each do |c|
			tag3.push c'<li><a href = "http://127.0.0.1:2000/tags?tag=#{tag}" + tag + " "">"</li>'
		end

		binding.pry
		tags2html = tags2html.gsub('{{tag3}}', tag3)
		client.puts tags2html

	end
client.close
end