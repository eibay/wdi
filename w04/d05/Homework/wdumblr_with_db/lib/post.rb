class Post < ActiveRecord::Base 
	def authors
		return Author.find_by("id", @attributes["author_id"])
	end
	def images
		return Image.select_by("post_id", @attributes["id"])
	end
end