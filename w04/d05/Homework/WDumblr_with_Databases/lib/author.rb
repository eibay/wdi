class Author < ActiveRecord::Base

	def posts 
		return Post.where(author_id: self.id)
	end
end