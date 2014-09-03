require 'pry'
require 'HTTParty'
require 'active_record'
require_relative './lib/connection.rb'
require_relative './lib/breeds.rb'

Dog.all.each do |dog|
  puts dog.breed 
end

puts "Which would you like to delete?"
delete = gets.chomp.downcase
deletedog = Dog.find_by({breed: delete})

HTTParty.delete("http://127.0.0.1:4567/dog/#{deletedog.id}", {:body => {:id => deletedog.id, :breed => deletedog.breed}})


