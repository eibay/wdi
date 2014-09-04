require 'httparty'
require 'pry'
require_relative './lib/connection'
require_relative './lib/breed'

breeds = Breed.all()
breeds.each do |breed|
	puts breed.breed
end
puts "Which breed do you want to delete?"
user_answer = gets.chomp
breed = Breed.find_by(breed: user_answer)


HTTParty.delete("http://127.0.0.1:4567/breeds/#{breed.id}")

