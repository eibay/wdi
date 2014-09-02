require 'active_record'
require_relative './model'
require_relative './author'
require_relative './image'


class Post < ActiveRecord::Base
	def author
		Author.find_by("id", @attributes["author_id"])
	end

	def images
	 	Image.where("post_id", @attributes["id"])
	 end

end