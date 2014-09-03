require_relative './model'

class Home < Model

	def chars
		return Home.select_by("id", @attributes["id"])
	end

end
