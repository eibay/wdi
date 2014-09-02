require_relative "./model"

class Image < Model
  def post
    return Post.find_by("id", @attributes["post_id"])
  end

end

