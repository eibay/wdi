class Post < ActiveRecord::Base 

	def author
		return Author.find_by(id: self.author_id)
	end

	def images
		return Image.where(post_id: self.id)
	end
end