require_relative './model'

class Car < Model

 def vroom
	return "VROOM!"
 end

 def clowns
 	## return all the clowns in this car
 	Clown.select_by("car_id", @attributes["id"])
 end
end