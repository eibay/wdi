require_relative './model'
require_relative './image'
require_relative './post'

class Author < Model

	 def posts
	 	Post.select_by("author_id", @attributes["id"])
	 end


end
