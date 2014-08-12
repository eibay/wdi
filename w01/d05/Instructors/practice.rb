require 'socket'
server = TCPServer.new 2000

while true
  client = server.accept

  puts "Client connected!"

  client.puts "<h1 style ='text-align: center;'>Hi, this is Sho's computer</h1>"

  client.puts "<h2 style ='text-align: center;'>Go <a href='10.32.126.134:2000'>here</a><br />There will be something fun!</h2>"

  request = client.read

  puts request

  client.close
end