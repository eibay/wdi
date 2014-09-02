require_relative './model'

class Image < Model 
	def post
		Post.find_by("keyword", @attributes["keyword"])
	end
end