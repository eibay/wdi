require_relative "./model.rb"
require_relative "./post.rb"
require_relative "./author.rb"

class Image < Model

	def post
		return Post.find_by("id", @attributes["post_id"])
	end

end