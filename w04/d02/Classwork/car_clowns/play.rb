require_relative './car'
require_relative './clown'
require 'pry'

# create a car
Car.create({color: "Pink", mileage: 40000, capacity: 10})

# create a clown
blue_car = Car.find_by("color", "Blue")
Clown.create({name: "Bozo", shoe_size: "XXXXL", car_id: blue_car["id"]})

# find all clowns in a specific car
Clown.select_by("car_id", blue_car["id"])

# find the car information for a clown
bozo = Clown.find_by("name", "Bozo")
Car.find_by("id", bozo["car_id"])

binding.pry