# base = %w(2 3 4 5 6 7 8 9 10 J Q K A)
# cards = []

# index = 0
# while index < base.length
# 	cards << base[index] + ' heart'
# 	cards << base[index] + ' clubs'
# 	cards << base[index] + ' spades'
# 	cards << base[index] + ' diamonds'
# 	index += 1
# end

# print cards

require 'socket'
server = TCPServer.new 2000
client = server.accept


# while true
#   client = server.accept

#   puts "Client connected!"

#   client.puts "Hello World"
#   request = client.gets.chomp
#   puts request

#   client.close
# end


while true
  client = server.accept

  puts "Client connected!"

  client.puts "<h1>He who is not courageous enough to take risks will accomplish nothing in life.</h1> <h4>Muhammad Ali</h4>  <a href='10.190.2.98:2000'>Andrea quote</a>"
 
  client.gets.chomp

  client.close
end