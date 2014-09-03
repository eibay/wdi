class Image < ActiveRecord::Base
  def post
    Post.find_by("id", @attributes["post_id"])
  end
end