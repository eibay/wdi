require 'pry'
require_relative ('./lib/methods')
require 'SecureRandom'

puts "Name of mechanic you would like to add?"

name = gets.chomp.downcase


puts "Age of mechanic you would like to add?"

age = gets.chomp

puts "Favorite car?"

car = gets.chomp.downcase

id = SecureRandom.hex

input = {name: name, age: age, car: car, id: id}

Mechanic.create(input)

puts Mechanic.all()