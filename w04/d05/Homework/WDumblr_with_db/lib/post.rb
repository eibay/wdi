require_relative './model'
require_relative './author'

class Post < Model

  def initialize(hash)
    @attributes = hash
  end

  def author
    return Author.find_by("id", @attributes["author_id"])
  end

  def images
    return Image.select_by("id", @attributes["image_id"])
  end
  
end
