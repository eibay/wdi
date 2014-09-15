require_relative './lib/connection'
require_relative './lib/breed'
require 'pry'
require 'httparty'

breeds = Breed.all

breeds.each do |b|
  puts b.species
end

puts "Please inform me as to which breed you would like to delete?"

breed = gets.chomp

doggy = Breed.find_by(species: breed)

id = doggy[:id]

HTTParty.delete("http://127.0.0.1:4567/#{id}", {:body => {:id => doggy.breed}})

puts "Gone to Doggy heaven"
