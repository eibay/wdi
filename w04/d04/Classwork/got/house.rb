require_relative './model'
require_relative './character'
require 'pry'


class House < Model

	def characters
		return Character.select_by("id", @attributes["id"])
	end

end