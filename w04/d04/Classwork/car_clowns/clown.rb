require_relative './model'

class Clown < Model

	def car
		car_id = @attributes["car_id"]

		car = Car.find_by("id", car_id)
		return car["id"]
end
end