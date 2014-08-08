require 'socket'

server = TCPServer.new 2000
client = server.accept

puts "A client has connected"
client.puts "Welcome to our server!"

user_said = client.gets
client.puts "Hello!"
client.puts "You said #{user_said}"
puts "#{user_said}"

client.close


#https://gist.github.com/jkonowitch/935d55d638d078be0dce
#to get IP