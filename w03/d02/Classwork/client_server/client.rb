# require 'socket'
require 'httparty'

# server = TCPSocket.new '127.0.0.1', 2000
# server.puts 'GET /?s=monkey'

response = HTTParty.get('http://127.0.0.1:2000')


# response = server.gets
# puts response
puts response

#server.close