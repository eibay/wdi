require 'pry'
require 'securerandom'
require 'JSON'

ids = JSON.parse(File.read("./mechanics.txt"))

puts "What is your name?"

name = gets.chomp

puts "What is your age?"

age = gets.chomp

puts "What is your favorite car?"

favorite_car = gets.chomp

ids << {name: name, age: age, favorite_car: favorite_car}

File.write("./mechanics.txt", ids.to_json)

