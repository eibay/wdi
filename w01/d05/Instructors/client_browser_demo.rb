require 'socket'
server = TCPServer.new 2000

while true
  client = server.accept

  puts "Client connected!"

  client.puts "<h1><center>Did you know that a strawberry is not a berry?</center></h1>
  <h4><center>But a banana is!</center></h4>
  <a href='http://10.241.19.40:2000'><center>This'll take you someplace else...</center</a>"

  client.gets.chomp

  client.close
end