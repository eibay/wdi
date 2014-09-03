class Author < ActiveRecord::Base
	def post
		Post.where(author_id: @attributes["id"])
	end
end