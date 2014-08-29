require_relative './model'

class Character < Model
	def house
		return House.find_by("id", @attributes["house_id"])
	end
end