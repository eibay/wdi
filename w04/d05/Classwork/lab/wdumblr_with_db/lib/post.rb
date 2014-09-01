require_relative './model'

class Post < Model
  def author
    Post.find_by("id", @attributes["post_id"])
  end
end