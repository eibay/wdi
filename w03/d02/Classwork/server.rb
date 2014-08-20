require 'socket'

server = TCPServer.new 2000

client = server.accept #we're listening

# in netcat you have to type something "client.gets" before client.puts 'hello world'
connect is 'client = server.accept', and the request is 'client.gets'
# in browser the connect and the request happen AT THE SAME TIME
# the 'request' already happens when the client types in the IP/port AND hits enter

client.gets #client gives us something they want to get from us

client.puts File.read('./index.htnl')

client.close


