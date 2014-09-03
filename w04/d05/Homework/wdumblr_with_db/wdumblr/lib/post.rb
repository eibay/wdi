
require_relative '../connection'
class Post < ActiveRecord::Base 
	def author
		Author.find_by("id author_id")
	end
	def images
		Image.select("post_id id")
	end
end

