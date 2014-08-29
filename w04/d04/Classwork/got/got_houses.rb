require_relative './model'

class House < Model
	def characters
		return Character.select_by("house_id", @attributes["id"])
	end
end
