require 'json'
require 'httparty'
require 'socket'
require 'pry'

server=TCPServer.new 2000
def parsepath(url)
queryparams={}
parsedpath=url.split("?")
path=parsedpath[0]
parsedpath=parsedpath[1].split("&")
parsedpath.each do |n|
  variables=n.split("=")
  param=variables[0].to_sym
  value=variables[1]
  queryparams[param]=value
end
  params = {
    path: path,
    query_params: queryparams
  }
 return params

end




 loop do
	client = server.accept
 	client_ip=client.remote_address.ip_address
 	
 	# binding.pry
 	request = client.gets.chomp
  	path = request.split(" ")[1]
  	puts path.split("/")[1]

 	if(path=="/")
 		client.puts File.read("./index.html")
 	elsif(path.split("/")[1]=="artists")&&(path.include? "?")
 		params=parsepath(path)
 		puts params[:queryparams]
 		response=HTTParty.get("http://musicbrainz.org/ws/2/artist/?query=artist:#{params[:query_params][:artist]}&fmt=json", headers: {"User-Agent" => "HTTParty"})
    puts response
 		artists_array=[]
 		response["artist"].each do |artist|
 			artists_array.push "<li><a href='/artist/?id=#{artist['id']}&artist=#{artist['name']}'>#{artist['name']} from #{artist["country"]}</a></li>"

 	end
 	html=File.read("./artists.html")
 	client.puts html.gsub("{{artists}}" , artists_array.join('')).gsub("{{artist}}" , params[:query_params][:artist])
 
	response=HTTParty.get("http://musicbrainz.org/ws/2/artist/#{params[:query_params][:id]}?inc=aliases&fmt=json", headers: {"User-Agent" => "HTTParty"})
 elsif(path.split("/")[1]=="artist")&&(path.include? "?")
  params=parsepath(path)
  response2=HTTParty.get("http://ws.audioscrobbler.com/2.0/?method=artist.getinfo&artist=#{params[:query_params][:artist]}&api_key=58a9d7cf360a35b1d4d77d1b8ea2477d&format=json&autocorrect=1")
  image_url= response2["artist"]["image"][3]["#text"]  
 	html=File.read("./indvidual_artist.html")

 	client.puts html.gsub("{{artist}}" , response["name"]).gsub("{{image}}", image_url)
 elsif path=="/styles.css"
  client.puts File.read("./styles.css")   
 end





	client.close
	puts "Client disconnected"
	
 end
