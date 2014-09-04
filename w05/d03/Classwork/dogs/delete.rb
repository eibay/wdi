# # HTTParty can send any type of request to any 
# # server, meaning that we can use it to hit our own servers.

# # Here is how we might send a post request to
# our own server HTTParty.post("http://127.0.0.1:4567", 
# 	{:body => {:age => 5}})

# # Note that the second argument to HTTParty.post is a 
# hash with one key/value pair where the key is 
# :body and the value is a hash of the params. 
# In this example we have one param age that has the value 5. There, of course, could be multiple params sent.

# # HTTParty can form PUT and DELETE requests in a 
# similar fashion.

# # Also note that our server has to be running 
# for this to actually work.

# # Create a command line app to delete a breed.

# # the app should list all current breeds and 
# then prompt the user for the name of a breed to delete
# # hit our own server as if it was an API and delete 
# that specific breed of dog
# # your app should not loop, just run once and 
# then exit (you can loop while developing your app
#  if it helps you test it out)

require "pry"
require "httparty"
require_relative "./breed.rb"
require_relative "./connection.rb"

puts "Press Enter for list of breeds. Press it. Doooo it."
gets
breeds = Breed.all

breeds.each do |breed|
	puts breed.name
end

puts "Which dog would you like to destroy, you psychopath? Remember to capitalize, you crazy sonavagun."
name = gets.chomp
breed = Breed.find_by({name: name})

HTTParty.delete("http://127.0.0.1:4567/", {:body => {"id" => breed.id}})

puts "Here is a list of survivors:"

breeds = Breed.all
breeds.each do |breed|
	puts breed.name
end
