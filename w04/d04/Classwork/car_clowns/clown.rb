require_relative './model'

class Clown < Model
	
	def car
		car = Car.find_by("id", attributes["car_id"])
		return car
	end

end