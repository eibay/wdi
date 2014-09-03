require_relative '../model'
require 'json'
require 'securerandom'

class Author < Model
    def posts
      return Post.select_by("author_id", @attributes["id"])
    end
end