require_relative './model'

class Author < Model
	def post
		Post.select_by("author_id", @attributes["id"])
	end
end
# 

# To find all the posts that "tom"(@attributes["id"]) wrote by going through all the posts "author_ids"

