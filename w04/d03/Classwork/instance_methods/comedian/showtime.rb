require_relative './comedian'
require 'pry'
load './jokes.rb'

nas = {name: "Nas", age: 26, joke: JOKES[0]}
raj = {name: "Raj", age: 40, joke: JOKES[1]}
david = {name: "David", age: 51, joke: JOKES[5]}

nas = Comedian.new(nas)
raj = Comedian.new(raj)
david = Comedian.new(david)

comedians = [nas, raj, david]

comedians.each do |comedian|
  comedian.info.each do |info|
    puts "#{info[:name]}: #{info[:age]} -- #{info[:fav_joke]}"
  end
end
