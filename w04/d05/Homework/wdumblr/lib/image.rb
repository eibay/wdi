require_relative './model'
require_relative './author'
require_relative './post'

require 'pry'

class Image < Model
	
	 def post
	 	Post.find_by("id", @attributes["post_id"])
	 end
	
end