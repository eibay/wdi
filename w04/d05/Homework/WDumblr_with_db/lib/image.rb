require_relative './model'
require_relative './post'


class Image < Model

  def post
    return Post.find_by("image_id", @attributes[:id])
  end

end
