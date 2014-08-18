require 'pry'
require 'json'
require 'socket'
require 'HTTParty'
require 'uri'

server = TCPServer.new 2000

loop do
	
client = server.accept
request = client.gets
path = request.split(" ")[1]

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

params = parse_url(path)

if path == "/"
	html = File.read('./views/index.html')
	client.puts(html)
elsif path == "/stylesheet.css"
	css = File.read('./styles/stylesheet.css')
	client.puts(css)
elsif params[:path] == "/music"
	response = HTTParty.get("http://musicbrainz.org/ws/2/artist/?query=artist:#{params[:query_params][:artist]}&fmt=json",  headers: {"User-Agent" => "Httparty"})
	if response.length == 1
		html = File.read('./views/throttled.html')
		client.puts html
		css = File.read('./styles/stylesheet.css')
		#client.puts css
	else
	html = File.read('./views/results.html')
	artistArr = []
	response["artist"].each do |x| artistArr<<"<li><a href=/artist/#{x["id"]}>#{x["name"]}</a></li>" end
	artistArr = artistArr.join('')
	artisttitle = URI.decode(params[:query_params][:artist]).split('+').join(' ')
	html = html.gsub('{{artist}}', artisttitle).gsub('{{results}}', artistArr)
	client.puts(html)
	end
elsif path.split('/')[1] == "artist"
		
		artistid = path.split('/')[2]
		response = HTTParty.get("http://musicbrainz.org/ws/2/artist/#{artistid}?inc=aliases&fmt=json",  headers: {"User-Agent" => "Httparty"})
		
		if response.length == 1
		html = File.read('./views/throttled.html')
		client.puts html
		css = File.read('./styles/stylesheet.css')
		else
		html = File.read('./views/artist.html')
		

		if response["name"] == nil
			artistname = "*NO INFOMATION PROVIDED*"
		else
		artistname = response["name"]
		end
		
		if (response["life-span"] == nil) || (response["life-span"]["begin"] == nil)
		artistyear = "*NO INFORMATION PROVIDED*"
		else
		artistyear = response["life-span"]["begin"]
		end

	
		if (response["begin_area"] == nil) || (response["begin_area"]["name"] == nil)
		artistloc = "*NO INFORMATION PROVIDED*"
		else
		artistloc = response["begin_area"]["name"]
		end
		
		html = html.gsub('{{artist}}', artistname).gsub('{{year}}', artistyear).gsub('{{location}}', artistloc)
		client.puts(html)
		css = File.read('./styles/stylesheet.css')
		#client.puts(css)
		end
		
else
	html = File.read('./views/404.html')
	client.puts(html)
	css = File.read('./styles/stylesheet.css')




# <p>{{artist}}, who hit the scene in {{year}}, formed in {{location}}</p>
end
client.close
end









