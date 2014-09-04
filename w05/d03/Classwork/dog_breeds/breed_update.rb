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
print "Which breed to update?"
breed_to_update = gets.chomp
print "Change name to?"
new_name = gets.chomp
breed = Breed.find_by(name: breed_to_update)

HTTParty.put("http://127.0.01:4567/breeds/#{breed.id}", {:body => {:id => breed.id, :name => new_name}} )