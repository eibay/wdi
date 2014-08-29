require_relative './model'

class Car < Model

	def clowns
		id = @attributes["id"] 
		
		clowns= Clown.select_by("car_id", id)
		
		clowns.each do |clown|
			return clown["name"]
		end

	end

end