require 'socket'
server = TCPServer.new 2000

while true
  client = server.accept

  puts "Client connected!"

  client.puts "<h1>Hello World</h1> <h4>Smaller Header</h4>  <a href='http://10.171.234.149:5757'>this is a link</a>"

  client.gets.chomp
  
  client.close
end