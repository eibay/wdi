require_relative './model'

class Post < Model
	def author
		Author.find_by("id", @attributes["author_id"])
	end
end

# To find the Author of a specific post (@attributes["author_id"]) by checking all the authors to find the matching "id"