

# 127.0.01 ==> self addressing things to your own IP address
#IP address is a unique address for your computer 
# ports are ways in which your IP address can connect to the internet. Only 1 program can use a single port at a time. 

require 'socket'

server = TCPServer.new 2000
client = server.accept

user_said = client.gets
client.puts "Hello!"
client.puts "You said #{user_said}"
puts "#{user_said}"

client.close

