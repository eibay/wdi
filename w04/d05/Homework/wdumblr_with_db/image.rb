class Image < ActiveRecord::Base

	def post
		Post.find_by("id", @attributes["id"])
	end

end