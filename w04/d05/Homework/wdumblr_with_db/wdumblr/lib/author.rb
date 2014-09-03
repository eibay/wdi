
require_relative '../connection'
class Author < ActiveRecord::Base

	def posts
		Post.select("author_id id")
	end
end


 