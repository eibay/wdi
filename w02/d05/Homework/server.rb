require 'pry'
require 'socket'
require 'json'
require 'httparty'


server = TCPServer.new 2000

def parse_url(url)
  path = url.split("?")[0]
  query_string = url.split("?")[1]

  params = {}
  params[:path] = path

  	search_word = query_string.split("=")[0]
  	search_value = query_string.split("=")[1]

  query_params = {}
  query_params[search_word.to_sym] = search_value

  params[:query_params] = query_params

  return params
end


loop do

  client = server.accept

  request = client.gets
  url = request.split(" ")[1]
  
if url == '/'
	html = File.read('./views/index.html')
    client.puts html


elsif url.include?('/artist?')
	params = parse_url(url)
	search_word = params[:query_params][:search_word]
	response = HTTParty.get("http://musicbrainz.org/ws/2/artist/?query=artist:#{search_word}&fmt=json", headers: {"User-Agent" => "Httparty"})
	
	html = File.read('./views/search_page.html')
	html = html.gsub("{{search}}", search_word.gsub('+', ' '))
	
	artists = []
	
	response["artist"].each do |artist_group|
	
		artist_name = artist_group["name"]

		if artist_group.include?("area")
			artist_origin = artist_group["area"]["name"]
			artists.push("<li>#{artist_name} (#{artist_origin}) - <a href='https://musicbrainz.org/artist/#{artist_group["id"]}'>More Info</a> </li>")
			
		else
			artists.push("<li>#{artist_name} - <a href='https://musicbrainz.org/artist/#{artist_group["id"]}'>More Info</a></li>")
		end
	end

	html = html.gsub('{{artists}}', artists.join(''))

  	client.puts html
  	

else 
	client.puts "Error"
end
client.close

end