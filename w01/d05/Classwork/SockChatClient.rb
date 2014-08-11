require 'socket'

s = TCPSocket.new '192.168.32.193', 2008

while output = gets
  s.puts output
  line = s.gets 
  puts line        
end