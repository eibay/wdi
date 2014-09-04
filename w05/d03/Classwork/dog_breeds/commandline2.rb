# DELETE

require_relative "./lib/connection"
require 'active_record'
require './lib/breed'
require 'httparty'
require 'pry'

breeds = Breed.all
puts "Breeds:"
breeds.each do |x|
	puts x.name
end
print "Which breed would you like to delete?"
breed_to_delete = gets.chomp
breed = Breed.find_by(name: breed_to_delete)

HTTParty.delete("http://127.0.01:4567/breeds/#{breed.id}", {:body => {:id => breed.id}} )