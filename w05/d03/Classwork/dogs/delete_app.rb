require_relative './lib/connection'
require_relative './lib/breeds'
require 'httparty'
require 'pry'

Breed.all().each do |b|
	puts b[:breed]
end

puts "What dog would you like to delete?"
breed = gets.chomp

breed_choice = Breed.find_by(breed: breed)

id = breed_choice[:id]

HTTParty.delete("http://127.0.0.1:4567/#{id}", {:body => {:breed => breed_choice.breed}})
