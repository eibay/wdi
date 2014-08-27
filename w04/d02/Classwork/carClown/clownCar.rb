require 'json'
require_relative './lib/car.rb'
require_relative './lib/clown.rb'
require 'securerandom'


2.times do
	puts "Enter car color"
	color = gets.chomp

	puts "Enter mileage"
	mileage = gets.chomp

	puts "Enter capacity"
	capacity = gets.chomp

	id = SecureRandom.hex

	car = { "color" => color, "mileage" => mileage, "capacity" => capacity, "id" => id }

	Car.add(car)
end


3.times do
	puts "Enter Name"
	name = gets.chomp

	puts "Enter Shoe Size"
	shoe_size = gets.chomp

	id = SecureRandom.hex

	assigned_car = JSON.parse(File.read('./car.txt'))

	clown = {"name" => name, "shoe_size" => shoe_size, "id" => id}

	Clown.add(clown)
end


