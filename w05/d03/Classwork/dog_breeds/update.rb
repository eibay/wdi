require 'httparty'
require 'pry'
require_relative './lib/connection'
require_relative './lib/dog'

dogs =  Dog.all()
dogs.each do |dog|
	puts dog.breed
end
puts "Which dog?"
user_answer = gets.chomp
dog = Dog.find_by(breed: user_answer)

puts "What is a new name?"
user_answer = gets.chomp
dog.name = user_answer

HTTParty.put("http://127.0.0.1:4567/dogs/#{dog.id}", {:body => {:name => dog.name, :breed => dog.breed, :id => dog.id}})
