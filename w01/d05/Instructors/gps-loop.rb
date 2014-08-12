require 'socket'
require 'colorize'
server = TCPServer.new 2000

while true
  client = server.accept

  puts "Client connected!"
client.puts "<font color='red'><blink><h1>My website is so annoying! PLEASE LEAVE<h1></font></blink> <h2><a href='10.6.113.186:2000'>EXIT HERE<a></h2>"

  client.close

end