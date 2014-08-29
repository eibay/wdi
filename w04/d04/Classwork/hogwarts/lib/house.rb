require_relative './model.rb'
require_relative './student.rb'

class House < Model

	def students
		return Student.select_by("house_id", @attributes["id"])
	end




end

