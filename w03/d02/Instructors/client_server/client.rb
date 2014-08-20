<<<<<<< HEAD
# require 'httparty'
require 'socket'

server = TCPSocket.new '127.0.0.1', 2000
# server.puts 'GET /?s=monkey'

# response = HTTParty.get('http://127.0.0.1:2000')

response = server.gets

html = File.read('./views/index.html')

client.puts html
=======
require 'socket'

server = TCPSocket.new '127.0.0.1', 2000
server.puts 'GET /?s=monkey'

response = server.gets
puts response

server.close
>>>>>>> bc740bd96e5fb8d8eb8261e22e004d18062d9618
