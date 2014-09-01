class Author < ActiveRecord::Base

	def posts
		Post.select_by("author_id", @attributes["id"])
	end

end