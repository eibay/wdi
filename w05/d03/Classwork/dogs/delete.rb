require_relative './lib/connection'
require_relative './lib/breed'
require 'pry'
require 'httparty'

breeds=Breed.all

breeds.each do |breed| 

	puts breed.name

end
puts "which breed would you like to delete?"

breed=gets.chomp

dog=Breed.find_by(name: breed)


HTTParty.delete("http://127.0.0.1:4567/#{dog.id}", {:body => {:id => dog.id}})

puts "dog successfully deleted"