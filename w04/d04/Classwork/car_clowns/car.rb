require_relative './model'

class Car < Model

def clowns
	Clown.select_by("car_id", @attributes["id"])
end


end