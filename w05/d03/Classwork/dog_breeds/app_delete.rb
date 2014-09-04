require 'pry'
require 'httparty'
require 'active_record'
require_relative './lib/breed'
require_relative './lib/connection'

breed = Breed.all.each do |dog|
	puts dog[:name]
end

puts "Which breed would you like to delete from the database?"

response = gets.chomp

deleted_breed = Breed.find_by({name: response})

HTTParty.delete("http://127.0.0.1:4567/#{deleted_breed.id}", {:body => {:id => deleted_breed.id, :name => deleted_breed.name}})

puts "#{response} deleted!"