require 'pry'
require 'HTTParty'
require_relative './lib/connection'
require_relative './lib/breed'
list = []
puts "please select a breed to update"
Breed.all().each do |dog|
	list<<dog["breed"]
end
puts list

old_name = gets.chomp
puts "please enter a new name for the breed"
new_name = gets.chomp
breed_to_update = Breed.find_by({breed: old_name})
HTTParty.put("http://127.0.0.1:4567/breeds/#{breed_to_update["id"]}", {:body => {:breed => new_name}})