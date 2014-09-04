require "pry"
require "httparty"
require_relative "./breed.rb"
require_relative "./connection.rb"

puts "Press Enter for all of the dogges."
gets
breeds = Breed.all

breeds.each do |breed|
	puts breed.name
end

puts "Which dog would you like to fix? 'Fix', get it? Like neuter."
name = gets.chomp
breed = Breed.find_by({name: name})

HTTParty.put("http://127.0.0.1:4567/", {:body => {"id" => breed.id}})

puts "Here is a list of survivors:"

breeds = Breed.all
breeds.each do |breed|
	puts breed.name
end

