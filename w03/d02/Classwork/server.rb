require 'socket'

server = TCPServer.new 2000

client = server.accept #the browser accepts the server as we r now acting as a server if we netcat or
#use our own ip, it waits for u to hit enter.

client.gets # Waits for client to say something, say u type hello then the line below executes n says
# hello world

client.puts "hello world"

client.close