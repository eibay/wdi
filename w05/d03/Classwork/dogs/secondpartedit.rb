require 'pry'
require 'HTTParty'
require 'active_record'
require_relative './lib/connection.rb'
require_relative './lib/breeds.rb'

Dog.all.each do |dog|
  puts dog.breed
end

puts "Which would you like to edit?"
edit = gets.chomp.downcase

puts "What would you like to make the breed"
newbreed = gets.chomp.downcase
editdog = Dog.find_by({breed: edit})


HTTParty.put("http://127.0.0.1:4567/dog/#{editdog.id}", {:body => {:id => editdog.id, :breed => newbreed}})
