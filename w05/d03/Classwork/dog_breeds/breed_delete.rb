require_relative "./connection"
require 'active_record'
require './lib/breed'
require 'httparty'
require 'pry'

breeds = Breed.all
puts "Breeds:"
breeds.each do |breed|
	puts breed.name
end
print "Which breed to delete?"
breed_to_delete = gets.chomp
breed = Breed.find_by(name: breed_to_delete)

HTTParty.delete("http://127.0.01:4567/breeds/#{breed.id}", {:body => {:id => breed.id}} )