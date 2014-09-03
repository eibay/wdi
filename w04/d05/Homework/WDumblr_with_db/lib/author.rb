require_relative './model'
require_relative './post'

class Author < Model

  def initialize(hash)
    @attributes = hash
  end

  def post
    return Post.select_by("author_id", @attributes["id"])
  end

end
