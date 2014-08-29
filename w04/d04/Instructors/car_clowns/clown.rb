require_relative './model'

class Clown < Model
<<<<<<< HEAD
	def car ### returns the car this clown
		return Car.find_by("id", @attributes["car_id"])
	end
=======
  def car
    return Car.find_by("id", @attributes["car_id"])
  end
>>>>>>> 8977d2feba37de8ab67ccdb6fb5b760ccfa8042b
end