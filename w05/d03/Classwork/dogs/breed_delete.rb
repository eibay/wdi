require 'pry'
require 'HTTParty'
require_relative './lib/connection'
require_relative './lib/breed'
list = []
puts "please select a breed for deletion"
Breed.all().each do |dog|
	list<<dog["breed"]
end
puts list

answer = gets.chomp
breed_to_destroy = Breed.find_by({breed: answer})
HTTParty.delete("http://127.0.0.1:4567/breeds/#{breed_to_destroy.id}")