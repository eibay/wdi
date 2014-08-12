require 'socket'
server = TCPServer.new 2001

while true
  client = server.accept

  puts "Client connected!"

  request = client.gets.chomp
  puts request

  client.puts "Hello World"

  client.close
end