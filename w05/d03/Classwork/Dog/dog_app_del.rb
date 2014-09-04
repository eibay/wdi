require 'httparty'
require 'pry'
require_relative './lib/connection'
require_relative './lib/breed'

breeds = Breed.all()

breeds.each do |b|
	puts b[:breed]
end

puts "Which breed would you like to delete?"
response = gets.chomp
# "puggle"
out_breed = Breed.find_by( { breed: response } )
# out_breed = { breed: puggle, id: 10}

HTTParty.delete("http://127.0.0.1:4567/breeds/delete/#{out_breed[:id]}", {:body => {:id => out_breed.id, :breed => out_breed.breed } })

puts "#{out_breed[:breed]} deleted"
#binding.pry

