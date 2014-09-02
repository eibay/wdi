require_relative './model.rb'
require_relative './post.rb'
class Image < Model
  def post
    Post.select_by("id",@attributes["post_id"])
end
end