require 'pry'
require 'json'
require 'socket'
require 'httparty'


server = TCPServer.new 2000

# http://musicbrainz.org/ws/2/artist/?query=artist:beyonce&fmt=json

def parse_url(url)
	path = url.split("?")[0]
	query_string = url.split("?")[1]

	params = {}
	params[:path] = path

	if query_string == nil
		return params
	end

	pairs = query_string.split("&")[0]
	pair = pairs.split("=")

	query_params = {}
	pair.each do |key_value|                                        
	   query_params[pair[0]] = pair[1]                               
	end  


  params[:query_params] = query_params

  return params
end

loop do
	client = server.accept
	request = client.gets

	path = request.split(" ")[1]
	params = parse_url(path)

	url = request.split(" ")[1]
	params = parse_url(url)
	artistname = url.split("=")[1]

if  path == "/"
    html = File.read('./html/index_artist.html')
    client.puts(html)
# elsif path == "/styles.css"
#     css = File.read('./stylesheets/styles.css')
#     client.puts(css)
elsif params[:path] == "/artists"
	response = HTTParty.get("http://musicbrainz.org/ws/2/artist/?query=artist:#{artistname}&fmt=json", headers: {"User-Agent" => "HTTParty"})

artists = []


    response["artist"].each do |name|
    individual_artists = File.read('./html/artists.html')
   	individual_artists= individual_artists.gsub('{{name}}', name["name"])
    # individual_artists = individual_artists.gsub('{{id}}', name["id"])
	artists.push(html)
	end

 else
    client.puts("<h1> i need help </h1>")


 client.close
	# html = html.gsub('{{names}}', artists.join(''))
	# client.puts(html)
end

end
# end