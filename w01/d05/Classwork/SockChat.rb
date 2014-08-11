require 'socket'

server = TCPServer.new 2008
connection = server.accept

while (input = connection.gets)
  puts input
  output=gets
  connection.puts output
end