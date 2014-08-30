class Author < ActiveRecord::Base

	def posts 
		return Post.where(author_id: @attributes["id"])
	end
end