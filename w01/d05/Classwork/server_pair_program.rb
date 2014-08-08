
require 'socket'

server = TCPServer.new 2000

while true
client = server.accept

# client.puts "Say something man!"

# courteous_greetings = client.gets.chomp

# greeting = ["Hi", "Hello", "How are you?"]

# if greeting.include?(courteous_greetings)
#   client.puts "What a pleasant greeting, have a good one man"
#   # client.puts "Awesome dude!"
# # elsif
# #   client.puts "Sweet!"
# else
# client.puts "Hey man, that's not cool! That's not how you greet people!"
# end

# client.close



client.puts "Guess atleast one of my ideal vacation spots!"

user_rp = client.gets.chomp

spots = ["London", "Tokyo", "Paris", "China"]

# new_var = client.gets.downcase

# downcase_spots = ["london, tokyo", "paris", "china"]

if spots.include?(user_rp)
  client.puts "Good guess bro, now pay for my trip :)"
# elsif downcase_spots.include?(new_var)
#   client.puts "Good guess bro, now pay for my trip! :)"
else
  client.puts "You don't know me at all, sadface banana :("
end

client.close
