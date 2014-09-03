require_relative './model'

class Author < Model
  def posts
    Post.select_by("author_id", @attributes["id"])
  end
end