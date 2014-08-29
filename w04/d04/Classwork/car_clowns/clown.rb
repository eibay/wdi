require_relative './model'

class Clown < Model

	def car
		Car.find_by("id", @attributes["car_id"])
	end

end