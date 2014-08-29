require_relative "./model"

class House < Model
	def character
		Character.select_by("house_id", @attributes["id"])
	end
end