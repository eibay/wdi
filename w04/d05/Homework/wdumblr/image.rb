require_relative "./model"

class Image < Model

	def post
		Post.find_by("id", @attributes["id"])
	end

end