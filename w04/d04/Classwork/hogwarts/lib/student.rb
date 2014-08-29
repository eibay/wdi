require_relative './model.rb'
require_relative './house.rb'

class Student < Model
	
	def house
		return House.find_by("id", attributes["house_id"])
	end

end