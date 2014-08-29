require_relative "./model"


class Houses < Model

	def characters
		Characters.select_by("house_id", @attributes["id"])
	end
end
