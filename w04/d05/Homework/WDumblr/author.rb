require_relative './model'

class Author < Model

	def posts
		author = @attributes["name"]
		posts = Post.select_by("author", author)
		
		return posts
	end

end
