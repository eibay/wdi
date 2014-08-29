require_relative './model'

class Clown < Model


	def car
		return Car.find_by("id", @attributes["car_id"])
	end

	def addToCar(carColor, clown)
		chosenCar = Car.find_by("color", carColor)
		chosenClown = Clown.find_by("name", clown)
		chosenClown.push("car_id" => chosenCar["car_id"])
	end
end