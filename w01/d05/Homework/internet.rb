require 'socket'
server = TCPServer.new 2000

while true
  client = server.accept

  puts "Client connected!"
client.puts "<h1>Happy Monday!!!</h1> <h4>can't wait til Friday</h4>  <a href='http://10.27.164.144:2000'>go on</a>"
#connecting to another persons id address
client.gets.chomp
#makes it work-dont know why

  # request = client.read
  # puts request

  client.close
end
#ifconfig | sed -En 's/127.0.0.1//;s/.*inet (addr:)?(([0-9]*\.){3}[0-9]*).*/\2/p'
#gets access our ip address for ourselves in terminal
# or 127.0.0.1 

#type in ip address :2000 in browser anyone and should be able to access it
