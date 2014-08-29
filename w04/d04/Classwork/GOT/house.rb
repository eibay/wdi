require_relative './model'
require 'pry'


class House < Model

	def characters
		id = @attributes["id"]
		characters = Character.select_by("house_id", id)
		return characters
	end


end
