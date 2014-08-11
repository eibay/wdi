require 'socket'


begin
 clientSession = TCPSocket.new( "localhost", 2008 ) 

rescue StandardError => bang
  puts "Error !! "
else


while !(clientSession.closed?) 

print "Enter message :  "
msg = gets
clientSession.puts msg 
received=clientSession.gets
puts received
end

end