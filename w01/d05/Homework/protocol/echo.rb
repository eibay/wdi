require 'socket'

server = TCPServer.new 2000
client = server.accept

user_said = client.gets.chomp.split (" ")
split_response = user_said[1]

client.puts "You said #{split_response}"


=beginuser_said2 = client.gets.chomp
client.puts "You said #{user_said2}"


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