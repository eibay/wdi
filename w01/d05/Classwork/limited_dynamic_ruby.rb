require 'socket'
server = TCPServer.new 2000
client = server.accept

puts "Client connected!"

client.puts "Hello Alex"
puts "Hello Alex"

a = client.gets.chomp
puts a

client.puts "nerds rule"
puts "nerds rule"

puts "Who else rule?"

c = client.gets.chomp
puts c

d = gets.chomp
client.puts d

e = client.gets.chomp
puts e

f = gets.chomp
client.puts f

client.puts "geeks rule too"
puts "geeks rule too"
Hide full text


client.close