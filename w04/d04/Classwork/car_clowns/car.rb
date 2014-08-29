require_relative './model'

class Car < Model

	def clowns
		return Clown.select_by("car_id", @attributes["id"])
		
	end

end

#   < lets Car inherent all the behavior from Model