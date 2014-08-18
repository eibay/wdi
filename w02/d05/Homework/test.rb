require 'json'
require 'httparty'
require 'socket'
require 'pry'



server=TCPServer.new 2000
loop do
client = server.accept
response=HTTParty.get("http://ws.audioscrobbler.com/2.0/?method=artist.getinfo&artist=#{params[:query_params][:artist]}&api_key=58a9d7cf360a35b1d4d77d1b8ea2477d&format=json")
image_url= response["artist"]["image"][3]["#text"]  
client.puts "<html><body><img src='#{image_url}' /></body></html>"
client.close
end