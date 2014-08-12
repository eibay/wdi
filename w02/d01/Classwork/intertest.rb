require 'socket'
server = TCPServer.new 2000

while true
  client = server.accept

  puts "Client connected!"

  client.puts "<h1>Go seeeeeeee</h1> 
  <h4>Meet Alex, aficionado of Thai food and resident of Harlem:</h4>  
  <a href='http://10.16.200.11:2000'>this is a link to Alex, aficionado of Thai food and resident of Harlem.</a>"

client.gets.chomp

  client.close
end