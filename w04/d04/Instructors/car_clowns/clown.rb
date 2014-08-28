require_relative './model'

class Clown < Model
	def car ### returns the car this clown
		return Car.find_by("id", @attributes["car_id"])
	end
end