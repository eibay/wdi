require_relative './comedian'
require 'pry'
load './jokes.rb'

nas = {name: "Nas", age: 26, fav_joke: JOKES[0]}
raj = {name: "Raj", age: 40, fav_joke: JOKES[1]}
david = {name: "David", age: 51, fav_joke: JOKES[5]}

nas = Comedian.new(nas)
raj = Comedian.new(raj)
david = Comedian.new(david)

comedians = [nas, raj, david]

comedians.each do |comedian|
  puts "#{comedian.info[:name]}:\n Age:#{comedian.info[:age]}\n Favorite Joke:#{comedian.info[:fav_joke]}"
end
