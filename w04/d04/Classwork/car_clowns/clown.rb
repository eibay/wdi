require_relative './model'

class Clown < Model

	def car
		return Car.find_by("id", @attributes["car_id"])
	end

end