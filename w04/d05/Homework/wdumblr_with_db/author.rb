class Author < ActiveRecord::Base
  self.primary_key = "id"

   def post
    return Post.where(author_id: @attributes["id"])
  end

end