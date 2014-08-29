require_relative './model'

class Car < Model

	def clowns
		clowns = Clown.select_by("car_id", @attributes["id"])
		return clowns
	end




end

