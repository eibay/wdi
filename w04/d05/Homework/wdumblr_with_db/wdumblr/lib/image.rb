
require_relative '../connection'
class Image < ActiveRecord::Base

	def post
		Post.find_by("id post_id")
	end
end