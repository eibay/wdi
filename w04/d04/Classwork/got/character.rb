require 'pry'
require_relative './house'
require_relative './model'

class Character < Model

	def house
		return House.find_by("id", @attributes["id"])
	end

end