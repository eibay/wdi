require_relative './model'

class Image < Model
	def post
		return Post.find_by("image_id", @attributes["id"])
	end
end
