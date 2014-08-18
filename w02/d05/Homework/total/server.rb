require 'pry'
require 'json'
require 'socket'
require 'httparty'

def convert(str)
	path = str.split("?")
	query_split = path[1].split("&")
	amp_split = []
	query_split.each do |param|
		amp_split << param.split("=")
	end
	batch = {
		path: path[0][1..-1],
		query_params: {}
	}
	amp_split.each do |arr|
		batch[:query_params][arr[0].to_sym] = arr[1]
	end
	batch
end

server = TCPServer.new 2000

loop do

	client = server.accept
	puts "#{Time.now} - Client has connected!"

	request = client.gets
	path = request.split(" ")[1]
	puts "#{Time.now} - Client requests #{path}"

	query = convert(path) if path.include?("?")

	if path == "/"
		client.puts File.read("./views/index.html")
		puts "#{Time.now} - Sent Client index.html"

	elsif path == "/style.css"
		client.puts File.read("./stylesheets/style.css")
		puts "#{Time.now} - Sent Client style.css"

	elsif query
		if query[:path] == "search"
			response = HTTParty.get("http://musicbrainz.org/ws/2/artist/?query=artist:#{query[:query_params][:artist]}&fmt=json", headers: {"User-Agent" => "HTTParty"})
			list = []
			search_hash = {}
			response['artist'].each do |hash|
				item = File.read("./views/search_item.html").gsub("{{name}}", hash["name"]).gsub("{{id}}", hash["id"])
				list << item
			end
			html = File.read("./views/search_results.html")
			html = html.gsub("{{list}}", list.join("\n")).gsub("{{name}}", query[:query_params][:artist])
			client.puts html
		elsif query[:path] == "result"
			response = HTTParty.get("http://musicbrainz.org/ws/2/artist/#{query[:query_params][:artist]}?inc=aliases&fmt=json", headers: {"User-Agent" => "HTTParty"})
			response["area"]["name"].prepend("The ") if response["area"]["name"] == "United States" || response["area"]["name"] == "United Kingdom"
			list = []
			if response["type"] == "Person"	
				list << File.read("./views/birth.html").gsub("{{year}}", response["life-span"]["begin"]) if response["life-span"]["begin"]
			else
				list << File.read("./views/formed.html").gsub("{{year}}", response["life-span"]["begin"]) if response["life-span"]["begin"]
			end
			list << File.read("./views/origin.html").gsub("{{place}}", response["area"]["name"]) if response["area"]["name"]
			list << File.read("./views/alias.html").gsub("{{alias}}", response["aliases"][0]["name"]) if response["aliases"][0]
			html = File.read("./views/artist.html")
			html = html.gsub("{{list}}", list.join(""))
			html = html.gsub("{{artist}}", response["name"])
			client.puts html
		end

	else
		client.puts "Don't know about that"
	end

	client.close
	puts "#{Time.now} - Disconnected from Client"
end