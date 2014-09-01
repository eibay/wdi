class Post < ActiveRecord::Base

	def author
		Author.find_by("id", @attributes["author_id"])
	end

	def images
		Post.select_by("post_id", @attributes["id"])
	end

end