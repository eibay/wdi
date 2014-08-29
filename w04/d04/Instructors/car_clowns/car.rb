require_relative './model'

class Car < Model
<<<<<<< HEAD
	def vroom
		return "VROOM!"
	end

	def clowns
		## return all the clowns in this car
		return Clown.select_by("car_id", @attributes["id"])
	end
=======
  def vroom
    return "VROOM!"
  end

  def clowns
    return Clown.select_by("car_id", @attributes["id"])
  end
>>>>>>> 8977d2feba37de8ab67ccdb6fb5b760ccfa8042b
end