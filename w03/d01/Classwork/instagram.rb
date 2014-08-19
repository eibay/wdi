require 'pry'
require 'httparty'
require 'socket'

server = TCPServer.new 2000

while true

	client = server.accept
	puts "Client connected"

	request = client.gets.chomp
	url - request.split(" ")[1]
	puts "Requesting #{url}"

if url == "/"
	#send a form requesting a search term

	
  <form action="/words" method="GET">
    <input type="text" name="specific_word" placeholder="Enter a word..." />
    <button>Submit</button>
  </form>


puts "Tag?"
tag = gets.chomp

response = HTTParty.get("https://api.instagram.com/v1/tags/#{tag}/media/recent?client_id=4ad7cc36c172434588afd340aa74cd01")

#response = HTTParty.get("https://api.instagram.com/v1/tags/#{tag}/media/recent&client_id=4ad7cc36c172434588afd340aa74cd01")




#puts response


# 4ad7cc36c172434588afd340aa74cd01
client.close
end