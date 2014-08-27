require 'pry'
require_relative ("./lib/methods")
require 'SecureRandom'

puts "What color is the car?"

color = gets.chomp

puts "What is the mileage?"

mileage = gets.chomp

puts = "Capicity of car?"

ID = SecureRandom.hex
binding.pry
cars = {"color" => color, "mileage" => mileage, "id" => ID}

Car.create(cars)


