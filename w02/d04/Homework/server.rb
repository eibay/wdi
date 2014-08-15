require 'socket'
require 'pry'
require 'json'

server = TCPServer.new 2000

loop do #same as while loop

client = server.accept
request = client.gets.chomp
path = request.split(" ")[1]

 
if path == '/'
	client.puts 'coverpage'

elsif path == '/words'
	client.puts '/words cover page'

elsif path == '/words/word' 
	client.puts '/words/word cover page'
	
elsif path == '/words/word/friend'
	friend_title = path.split('/')[3]
	
	omdb_api = TCPSocket.new 'www.omdbapi.com', 80
	omdb_api.puts "GET /?s=#{friend_title}"

	json_response = omdb_api.gets.chomp
	parsed_response = JSON.parse(json_response)

	omdb_api.close
	client.puts parsed_response
	client.puts ["Title"]

elsif path == '/words/word/monkey'
	monkey_title = path.split('/')[3]
	
	omdb_api = TCPSocket.new 'www.omdbapi.com', 80
	omdb_api.puts "GET /?s=#{monkey_title}"

	json_response = omdb_api.gets.chomp
	parsed_response = JSON.parse(json_response)

	omdb_api.close
	client.puts parsed_response
	client.puts ["Title"]


elsif path == '/words/word/true'
	true_title = path.split('/')[3]
	
	omdb_api = TCPSocket.new 'www.omdbapi.com', 80
	omdb_api.puts "GET /?s=#{true_title}"

	json_response = omdb_api.gets.chomp
	parsed_response = JSON.parse(json_response)

	omdb_api.close
	client.puts parsed_response 
	client.puts ["Title"]


#     html = File.read('./views/index.html')
#     client.puts(html)

# elsif path == "/styles.css"
#     css = File.read('./stylesheets/styles.css')
#     client.puts(css)

# else
#     html = File.read('./views/404.html')
#     client.puts(html)
end
client.close
end