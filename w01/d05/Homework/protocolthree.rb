# 3. Ping Pong
#   * Client says: `ping`
#   * Server says: `pong`




require 'socket'

server = TCPServer.new 2000
client = server.accept

puts "A client has connected"
client.puts "Welcome to our server!"
client.puts "Type in the word 'ping'"

user_said = client.gets
client.puts ("pong")
puts "#{user_said}"


client.close
