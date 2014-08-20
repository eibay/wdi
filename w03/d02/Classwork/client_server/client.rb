require 'socket'
server= TCPSocket.new '127.0.0.1', 2000 #to get stuff from our ruby file
server.puts 'GET /?s=monkey'
response = server.gets
puts response
server.close

#this is acting as client trying to get information from the server
#when we are a client, we are are TCPSOCKET.new (outgoing calls)(like when trying to get an api)
#when we are a server, we are TCPSERVER.new (incoming calls)-always listening

# require 'httparty'
# response = HTTParty.get('http://127.0.0.1: 2000')
# puts response
#cant use it is too simple code
