require_relative './car'
require_relative './clown'
require 'pry'

Clown.create({
	name: "Sylvie",
	shoe_size: "44",
	car_id: Car.find_by("color", "Blue")["id"]
	})

Clown.create({
	name: "Mo",
	shoe_size: "22",
	car_id: Car.find_by("color", "Red")["id"]
	})

Clown.create({
	name: "Mabel",
	shoe_size: "88",
	car_id: Car.find_by("color", "Blue")["id"]
	})

Car.create({
	color: "Puce",
	mileage: "200000",
	capacity: 4
	})

Car.create({
	color: "Silver",
	mileage: "200",
	capacity: 14
	})




binding.pry