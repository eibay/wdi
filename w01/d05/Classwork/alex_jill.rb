

# 192.168.32.126 #jill
# # ifconfig | sed -En 's/127.0.0.1//;s/.*inet (addr:)?(([0-9]*\.){3}[0-9]*).*/\2/p'
# 192.168.32.143 #alex

require 'socket'
server = TCPServer.new 2000
client = server.accept

puts "Hello Alex"
client.puts "Hello Alex"

puts "What is your favorite flower?"
client.puts "What is your favorite flower?"
a = client.gets.chomp

puts a
client.puts a

puts "What is your favorite musician?"
client.puts "What is your favorite musician?"
b = client.gets.chomp

puts b
client.puts b


# a = client.gets.chomp
# puts a

# client.puts "nerds rule"
# puts "nerds rule"

# c = client.gets.chomp
# puts c

# d = gets.chomp
# client.puts d

# e = client.gets.chomp
# puts e

# f = gets.chomp
# client.puts f

# client.puts "geeks rule too"
# puts "geeks rule too"


# requested_location = client.gets.chomp

# locations = ["New York", "San Francisco", "Dallas"]

# if locations.include?(requested_location)
#   client.puts "YES we go here"
# else
#   client.puts "NOPE"
# end

client.close



