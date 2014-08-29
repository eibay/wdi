require_relative './model'

class Character < Model

	def find_house
		return House.find_by("id", @attributes["house_id"])
	end
end