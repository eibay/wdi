require_relative './car'
require_relative './clown'
require 'pry'


Clown.create({
	name: "Mike", shoe_size: "XXXXL", car_id: Car.find_by("color", "Red")["id"]
 })

Clown.create({
	name: "Johnny", shoe_size: "XXXXL", car_id: Car.find_by("color", "Red")["id"]
 })

red_car = Car.find("color", "Red")
red_car.clowns

binding.pry