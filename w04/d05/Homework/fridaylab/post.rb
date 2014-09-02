require_relative './model'

class Post < Model
	def author
		return Author.find_by("id", @attributes["author_id"])
	end
	def image
		return Image.select_by("id", @attributes["image_id"])
	end
end
