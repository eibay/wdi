require_relative './car'
require_relative './clown'
require 'pry'

<<<<<<< HEAD
Clown.create({
	name:"John",
	shoe_size:"XS"
	})

blue_car = Car.find_by("color", "Blue")[:id]

puts Clown.select_by("car_id", blue_car)
=======
# Clown.create({
#   name: "Sylvie", 
#   shoe_size: "XXXXXL", 
#   car_id: Car.find_by("color", "Blue")["id"]
# })

# Clown.create({
#   name: "Pete", 
#   shoe_size: "XXXL", 
#   car_id: "d7be2a8878893d041bb5b7c732c99ad5"
# })

# blue_car = Car.find_by("color", "Blue")
# blue_car.clowns

# sylvie = Clown.find_by("name", "Sylvie")
# sylvie.car

binding.pry
>>>>>>> 8977d2feba37de8ab67ccdb6fb5b760ccfa8042b
