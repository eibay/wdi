class Image < ActiveRecord::Base
  def post
    return Post.find_by("id", @attributes["post_id"])
  end

end

