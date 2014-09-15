require 'httparty'
require_relative './lib/connection'
require_relative './lib/dog'
require 'pry'

dogs = Dog.all

dogs.each do |dog|
	puts dog.breed
end

puts "Which dog breed would you like to delete?"

response = gets.chomp
dog = Dog.find_by(breed: response)
id = dog.id

request= HTTParty.delete("http://127.0.0.1:4567/dog/#{id}")

