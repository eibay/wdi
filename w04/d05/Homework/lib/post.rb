require_relative '../model'
require 'json'
require 'securerandom'

class Post < Model
	def author
    	return Author.find_by("id", @attributes["author_id"])
  	end
end