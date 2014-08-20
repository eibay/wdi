# THIS IS THE CLIENT SIDE SO WHERE WE HAVE CLIENT.GETS AND CLIENT.PUTS IN SERVER, HERE WE USE SERVER.GETS AND SERVER.PUTS TO SPEAK TO IT AND TELL IT WHAT TO DO
# WE CONNECT USING SOCKET IN CLIENT, VS. SERVER IN SERVER

# ONE APPROACH

require 'socket'

# server = TCPServer.new 2000 - FOR server
server = TCPSocket.new '127.0.0.1', 2000 #FOR client

# client = server.accept #DONT NEED THIS ON CLIENT SIDE

server.puts 'GET /?s=monkey'
response = server.gets
puts response - #this will give us server msg 'Hello World'

server.close


# ANOTHER APPROACH - using httparty

require 'httparty'

response = HTTP("https://127.0.0.1")

puts response

# don't need server.close because httparty does this for us