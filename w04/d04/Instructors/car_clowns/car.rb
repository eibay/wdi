require_relative './model'

class Car < Model
	def clowns
		return Clown.select_by("car_id", @attributes["id"])
	end
  def vroom
    return "VROOM!"
  end
end