require_relative './model'

class Post < Model 
	def author
		Author.find_by("id", @attributes["author_id"])
	end
	def images
		Image.select_by("keyword", @attributes["keyword"])
	end
end

