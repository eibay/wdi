require 'socket'
server = TCPServer.new 3000
client = server.accept

client.puts "Let's play marry, boff, kill."
client.puts
client.puts "Who would you marry?"
marry = client.gets.chomp

client.puts "Who would you boff?"
boff = client.gets.chomp

client.puts "Who would you kill?"
kill = client.gets.chomp

client.puts "You said you would marry #{marry}, boff #{boff}, and kill #{kill}."
client.puts "You are desperate, horny, and homicidal. Seek help."

client.close
