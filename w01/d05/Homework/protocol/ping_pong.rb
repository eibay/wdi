require 'socket'

server = TCPServer.new 2000
client = server.accept


user_said = client.gets.chomp

if user_said == "ping" 

client.puts "pong"

else
client.puts "error"

client.close

=begin
	
rescue client.puts "Ping"


client.puts user.said "!"

client.puts "In a word, tell me how you're doing today?"

next_user_said = client.gets.chomp.downcase
client.puts "If it's not too personal, please tell me why you're #{next_user_said}."

penultimate_user_said = client.gets.chomp
client.puts "Interesting... Would you like to continue this discussion? Yes or no?"

last_user_said = client.gets.chomp.downcase => e
	
end

elsif last_user_said == "no" 
client.puts "Sheesh. Was it something I said? Later!"