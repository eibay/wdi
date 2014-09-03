require_relative './model.rb'
require_relative './post.rb'
require "securerandom"

class Image < Model



  def post
    Post.find_by("id", @attributes['post_id'])
  end

end 
