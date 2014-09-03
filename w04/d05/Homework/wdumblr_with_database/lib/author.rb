require 'active_record'
require_relative './model'
require_relative './image'
require_relative './post'

class Author < ActiveRecord::Base
	def post
		Post.where({author_id: @attributes["id"]})
	end
end