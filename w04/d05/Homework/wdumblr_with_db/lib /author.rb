require_relative "./model"

class Author < ActiveRecord::Base
	def post
		return Post.where({author_id: @attributes["id"]})
	end
end