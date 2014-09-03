require_relative './model'

class Clown < Model
	def car
		###returns the car this clown is driving
		return Car.find_by
	end

end