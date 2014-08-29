class Post < ActiveRecord::Base
	def author
		Author.find_by(id: @attributes["author_id"])
	end

	def image
		Image.where(post_id: @attributes["id"])
	end
end