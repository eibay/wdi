require 'pry'
require 'httparty'
require 'active_record'
require_relative './lib/breed'
require_relative './lib/connection'

breed = Breed.all.each do |dog|
	puts dog[:name]
end

puts "Which breed would you like to update in the database?"

response = gets.chomp

puts "Which breed would you like to update?"
update = gets.chomp

updated_breed = Breed.find_by({name: response})

HTTParty.put("http://127.0.0.1:4567/breed/#{updated_breed.id}", {:body => {:id => updated_breed.id, :name => update}})

puts "#{response} updated to #{update}!"