require_relative './lib/connection'
require_relative './lib/breed'
require 'pry'
require 'httparty'

breeds = Breed.all

breeds.each do |b|
  puts b.species
end

puts "Please inform me as to which breed you would like to update?"

breed = gets.chomp

puts "New breed name?"

modify_breed = gets.chomp

doggy = Breed.find_by(species: breed)

HTTParty.delete("http://127.0.0.1:4567/#{doggy.id}", {:body => {:id => doggy.id, :species => modify_breed}})

puts "Modified doggy name!"
