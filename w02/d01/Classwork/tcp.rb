require 'socket'
server = TCPServer.new 2000

while true
  client = server.accept

  puts "Client connected!"

  client.puts "<html><h1>Hello WDI!</h1><h4><img src='http://media.giphy.com/media/LPCjVh9odU3FS/giphy.gif' alt='Kittens!'><br/><br/> <a href='http://10.44.122.26:2000'>Visit Tejal next</a></html>"
  
client.gets.chomp

  client.close
end


# Look up IP address:
#  ifconfig | sed -En 's/127.0.0.1//;s/.*inet (addr:)?(([0-9]*\.){3}[0-9]*).*/\2/p'