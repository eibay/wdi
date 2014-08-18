require 'pry'
require 'httparty'
require 'socket'

server = TCPServer.new 2000

def parse_url(url)
  path = url.split("?")[0]
  query_string = url.split("?")[1]

  params = {}
  params[:path] = path

  if query_string == nil
    return params
  end

  pairs = query_string.split("&")

  key_values = []

  pairs.each do |pair|
    key_values.push(pair.split("="))
  end

  query_params = {}

  key_values.each do |key_value|
    query_params[key_value[0].to_sym] = key_value[1]
  end

  params[:query_params] = query_params

  return params
end

artist_ids = []

loop do

	client = server.accept
	puts "Client connected"

	response = client.gets.chomp
	puts "Client is requesting #{response}"

	url = response.split(' ')[1]
	params = parse_url(url)

	if params[:path] == "/"
		html = File.read("./views/index.html")
		client.puts html
		puts "Sent client index.html"

	elsif params[:path] == "/stylesheets/style.css"
		css = File.read("./stylesheets/style.css")
		client.puts css
		puts "Sent client style.css"

	elsif params[:path] == "/favicon.ico"
		client.puts "favicon not found"
		puts "Sent client favicon error"
		
	elsif params[:path] == "/artist"
		response = HTTParty.get("http://musicbrainz.org/ws/2/artist/?query=artist:#{params[:query_params][:artist]}&fmt=json", headers: {"User-Agent" => "HTTParty"})
		
		artist_list = []

		response['artist'].each do |artist| 
			artist_list.push("<li><a href='#{artist['id']}'>#{artist['name']}</a></li>")
			artist_ids.push("#{artist['id']}")
		end

		html = File.read('./views/artists.html')
		html = html.gsub("{{word}}", params[:query_params][:artist]).gsub("{{artist_list}}", artist_list.join(''))
		client.puts html
		puts "Sent client artists.html"
	
	elsif artist_ids.include?(params[:path].split('/')[1])
			specific_artist = HTTParty.get("http://musicbrainz.org/ws/2/artist/#{params[:path].split('/')[1]}?inc=aliases&fmt=json", headers: {"User-Agent" => "HTTParty"})

			html = File.read("./views/specific_artist.html")
			html = html.gsub("{{artist}}", specific_artist["name"])
			
			if specific_artist["country"] != nil
				html = html.gsub("{{country}}", specific_artist["country"])
			else 
				html = html.gsub("{{country}}", "-")
			end
			if specific_artist["life-span"]["begin"] != nil
				html = html.gsub("{{started}}", specific_artist["life-span"]["begin"])
			else 
				html = html.gsub("{{started}}", "-")	
			end	
			if specific_artist["life-span"]["end"] != nil
				html = html.gsub("{{ended}}", specific_artist["life-span"]["end"])
			else 
				html = html.gsub("{{ended}}", "-")
			end
			client.puts html
			puts "Sent client specific_artists.html"	
	end
	
	client.close
	puts "Client disconnected"
end