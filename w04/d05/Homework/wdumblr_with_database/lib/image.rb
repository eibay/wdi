require 'active_record'
require_relative './model'
require_relative './author'
require_relative './post'


require 'pry'

class Image < ActiveRecord::Base
	
	 def post
	 	Post.find_by("id", @attributes["post_id"])
	 end
	
end

