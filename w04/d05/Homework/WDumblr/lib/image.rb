require_relative './model'

class Image < Model

	 def posts
	 	Post.find_by("id", @attributes["post_id"])
	 end


end
