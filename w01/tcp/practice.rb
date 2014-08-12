require 'socket'
server = TCPServer.new 2000

while true
  client = server.accept

  puts "Client connected!"

  client.puts "<h1>Hi WDI Rosencrantz!</h1> <h4>I am really enjoying WDI 2.0, seriously. There's nowhere I'd rather be on a beautiful summer's day.</h4>  <a href='http://10.27.164.144:2000'>this is a link</a>"
  
  client.gets.chomp

  client.close
end
