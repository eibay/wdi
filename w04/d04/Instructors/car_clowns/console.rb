require_relative './car'
require_relative './clown'
require 'pry'

Clown.create({
	name:"John",
	shoe_size:"XS"
	})

blue_car = Car.find_by("color", "Blue")[:id]

puts Clown.select_by("car_id", blue_car)