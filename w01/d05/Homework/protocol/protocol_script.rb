require 'socket'

server = TCPServer.new 2000
client = server.accept

client.puts "Hello! Say something!"

user_said = client.gets.chomp
client.puts user.said.upcase "!"

client.puts "In a word, tell me how you're doing today?"

next_user_said = client.gets.chomp.downcase
client.puts "If it's not too personal, please tell me why you're #{next_user_said}."

penultimate_user_said = client.gets.chomp
client.puts "Interesting... Would you like to continue this discussion? Yes or no?"

last_user_said = client.gets.chomp.downcase

if last_user_said == "yes" 
client.puts "Interesting but, sorry, Chatty Kathy, I gotta go."

elsif last_user_said == "no" 
client.puts "Sheesh. Was it something I said? Later!"

else
client.puts "Was that English?"
end

client.close