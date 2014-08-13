# require 'socket'
# server = TCPServer.new 2000 # we chose 2000 for the port, we can choose any number. 127.0.0.1 the STANDARD 
# client = server.accept

# client.puts "Where do you want to go?"
# # while true # will keep the program running, but you will need to keep initiating nc connection
# requested_location = client.gets.chomp

# locations = ["New York", "San Francisco", "Dallas"]

# if locations.include?(requested_location)
#   client.puts "YES we go here"
# else
#   client.puts "NOPE"
# end

# client.close

require 'socket'
server = TCPServer.new 2000 # we chose 2000 for the port, we can choose any number. 127.0.0.1 the STANDARD 
client = server.accept


client.puts "What would you like to eat? Please see the following choices:" 
client.puts "Steak, Roast Chicken, Roast Turkey, Chicken Fingers, Salad"

food_on_menu = client.gets.chomp
food = ["Steak", "Roast Chicken", "Roast Turkey", "Chicken Fingers", "Salad"]

if food.include?(food_on_menu)
  client.puts "Your order has been taken."
else
  client.puts "I told you to pick from the selection you moron. Get out of my resturant!"
end 


client.puts "In the meantime, what would you like to drink? We have:"
client.puts "Water, Soda, Wine, Beer, and Whiskey."

drinks_on_menu = gets.clients.puts.chomp#######FIX LATER the name of your server.gets will get your response
drink = ["Water", "Soda", "Wine", "Beer", "Whiskey"]

if drink.include?(drinks_on_menu)
	client.puts "Your drinks will be out as soon as possible!"
else
	client.puts  "We don't have that on the menu, get out!"
end

client.close