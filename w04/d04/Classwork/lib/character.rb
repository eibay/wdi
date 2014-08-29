require_relative './model'

class Character < Model
	def house
    return House.select_by("id", @attributes["house_id"])
  	end
end