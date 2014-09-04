require_relative './lib/connection'
require_relative './lib/breed'
require 'pry'
require 'httparty'

breeds=Breed.all

breeds.each do |breed| 

	puts breed.name

end
puts "which breed would you like to update?"

breed=gets.chomp

puts "What would you like to change it to?"

new_breed=gets.chomp

dog=Breed.find_by(name: breed)


HTTParty.put("http://127.0.0.1:4567/#{dog.id}", {:body => {:id => dog.id, :name => new_breed}})

puts "dog name successfully updated"