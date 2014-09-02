require_relative './model.rb'
require_relative './post.rb'

class Author < Model

  def post
    Post.select_by("author_id", @attributes["id"])
  end
end
