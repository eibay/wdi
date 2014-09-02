require_relative './model'

class Author < Model
	def post
		Post.select_by("author_id", @attributes["id"])
	end
end