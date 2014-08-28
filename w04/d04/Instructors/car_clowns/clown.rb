require_relative './model'

class Clown < Model
	def car
		return Car.find_by("id", @attributes["car_id"])
	end
end

#find_by used to find only one whereas select_by is used to find all 
