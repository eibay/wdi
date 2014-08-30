class Post < ActiveRecord::Base 

	def author
		return Author.find_by(id: @attributes["author_id"])
	end

	def images
		return Image.where(post_id: @attributes["id"])
	end
end