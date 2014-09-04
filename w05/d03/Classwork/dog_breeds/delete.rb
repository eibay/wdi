require 'httparty'
require 'pry'
require_relative './lib/connection'
require_relative './lib/dog'

dogs =  Dog.all()
dogs.each do |dog|
	puts dog.breed
end
puts "Which breeds do you want to delete?"
user_answer = gets.chomp
dog = Dog.find_by(breed: user_answer)

HTTParty.delete("http://127.0.0.1:4567/dogs/#{dog.id}")
