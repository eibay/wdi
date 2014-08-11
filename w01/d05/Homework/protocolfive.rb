# 5. Come up with your own protocol!

require 'socket'

server = TCPServer.new 2000
client = server.accept

user_names = ["neel", "sean", "jeff"]

client.puts "Welcome to Iris' computer!"
client.puts "What is your name?"
user_input2 = client.gets.chomp
puts user_input2.class
puts user_names.include?(user_input2)

if user_names.include? user_input2
client.puts "What's your favorite color?"
user_input = client.gets
if user_input.chomp == "aqua"
client.puts "AQUA IS GREAT!"
else
client.puts "#{user_input.chomp} ehhh, Aqua is better!"
end 

client.puts "See ya!"
client.puts

client.close

else

client.puts "Sorry! You are not a registered user."
client.puts "See ya!"
client.puts

client.close
end

