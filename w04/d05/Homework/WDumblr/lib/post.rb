require_relative './model'
require_relative './image'
require_relative './author'

class Post < Model

	 def author
	 	Author.find_by("id", @attributes["author_id"])
	 end

	 def images
	 	Image.select_by("post_id", @attributes["id"])
	 end


end
