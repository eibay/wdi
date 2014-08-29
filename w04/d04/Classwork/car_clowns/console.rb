require_relative './car'
require_relative './clown'
require 'pry'

clown02 = {
	name: "Inky", 
	shoe_size: "XXL", 
	car_id: Car.find_by("color", "Blue")["id"]
}
Clown.create(clown02)

clown03 = {
	name: "Blinky", 
	shoe_size: "XXXXL", 
	car_id: Car.find_by("color", "Blue")["id"]
}
Clown.create(clown03)

binding.pry