require 'socket'

server = TCPServer.new 2000
client = server.accept

client.puts "Hello! Welcome to my server. What do you want to do?"
user_input = client.gets.chomp
client.puts "you want to #{user_input}. Is there anything else you want do you?"
user_input2 = client.gets.chomp
client.puts "Lets #{user_input} and #{user_input2}!!"

client.close
