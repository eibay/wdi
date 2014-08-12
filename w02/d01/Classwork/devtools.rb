require 'socket'
server = TCPServer.new 2000

while true
  client = server.accept

  puts "Client connected!"

  client.puts "<h1>This is Timoor</h1>  <a href='http://10.241.19.40:2000'>this is a link</a>"
  client.gets.chomp

  # request = client.read
  # puts request

  client.close
end