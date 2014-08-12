require 'socket'

server = TCPServer.new 2000
while true
  client = server.accept
puts "Client connected!"
client.puts "<html><body bgcolor='ffd700'><font color='red'><marquee><h1>My website is so annoying! PLEASE LEAVE<h1></marquee><h3><marquee><a href='http://10.6.113.186:2000'>EXIT HERE, or DON'T I DON'T CARE, Existence is futile<a></marquee></h3></body></html>"
client.gets.chomp
client.close
end
