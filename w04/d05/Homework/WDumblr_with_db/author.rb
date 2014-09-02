require_relative './model'
require_relative './connection'

class Author < ActiveRecord::Base

	def posts
		author = @attributes["name"]
		posts = Post.select_by("author", author)
		
		return posts
	end

end
