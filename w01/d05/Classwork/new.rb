require 'socket'

server = TCPServer.new 2000

while true ## to keep server listening

client = server.accept

client.puts "what's up?"
user_said = client.gets.chomp
client.puts "Nice to meet you, #{user_said}. Where are you from?"
user_location = client.gets.chomp
client.puts "Oh, that's awesome! I'm from #{user_location} too!"

client.close

end 
