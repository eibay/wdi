require_relative './model'
require_relative './author'

class Post < Model

	def author
		Author.find_by("id", @attributes["author_id"])
	end


end