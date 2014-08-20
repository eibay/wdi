require 'socket'
server = TCPServer.new 2000
client = server.accept
client.gets #just getting because need to otherwise wont work because client has to say something and you have to take their message
client.puts "hello world"
client.close
#this is acting as server!!!!
#when we are a client, we are are TCPSOCKET.new (outgoing calls)(like when trying to get an api)
#when we are a server, we are TCPSERVER.new (incoming calls)-always listening