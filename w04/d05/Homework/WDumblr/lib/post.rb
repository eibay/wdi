require_relative './model'

class Post < Model

	 def author
	 	Author.find_by("id", @attributes["author_id"])
	 end

	 def images
	 	Image.select_by("image_id", @attributes["id"])
	 end


end
