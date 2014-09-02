require_relative './model'

class Author < Model

  def posts
    return Post.select_by("author_id", @attributes["id"])
  end

end

