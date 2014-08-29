class Post < ActiveRecord::Base
  self.primary_key = "id"

	def author
    return Author.find_by(id: @attributes["author_id"])
  end
  def images
  	return Image.find_by(post_id: @attributes["id"])
  end

end


