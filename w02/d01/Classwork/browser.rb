require 'socket'
server = TCPServer.new 2000

while true
  client = server.accept

  puts "Client connected!"

  client.puts "<h1>Joe Biggica</h1> <h4>Welcome</h4>  <a href= http://10.241.19.40:2000>this is a link</a>"
  
  client.gets.chomp
  
  client.close
end