require_relative './model'

class Character < Model

	def house
		house_id = @attributes["house_id"]

		house= House.find_by("id", house_id)
		return house

	end


end
