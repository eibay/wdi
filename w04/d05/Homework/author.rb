class Author < ActiveRecord::Base

  def posts
    return Post.select_by("author_id", @attributes["id"])
  end

end

