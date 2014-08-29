require_relative './model'

class House < Model

	def find_characters
		return Character.select_by("house_id", @attributes["id"])
	end
end
