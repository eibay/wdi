require_relative './model.rb'
require_relative './author.rb'
require_relative './image.rb'

class Post < Model
	
	def author
		return Author.find_by("id", @attributes["author_id"])
	end

	def images
		return Image.select_by("post_id", @attributes["id"])
		
	end
end