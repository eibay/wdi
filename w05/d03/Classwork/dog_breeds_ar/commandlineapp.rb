
require 'httparty'
require_relative './server'
require 'pry'

# HTTParty.delete("http://127.0.0.1:4567", {:body => {:age => 5}}


# 	**Create a command line app to delete a breed**.
# - the app should list all current breeds and then prompt the user for the name of a breed to delete
# - hit our own server as if it was an API and delete that specific breed of dog
# - your app should not loop, just run once and then exit (you can loop while developing your app if it helps you test it out)

dogs = Dog.all()

puts("Provided is a list of all the dogs and their breeds")

dogs.each do |dog|
	puts dog["breed"]
end


binding.pry

puts("Which dog do you want to delete by breed?")
dogbreed = gets.chomp

HTTParty.delete("http://127.0.0.1:4567", {body: {:breed => "#{dogbreed}"}})

