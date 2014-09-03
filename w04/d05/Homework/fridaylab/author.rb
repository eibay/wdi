require_relative './model'

class Author < Model
	def post
		return Post.select_by("author_id", @attributes["id"])
	end
end
