require_relative './model'

class Image < Model
  def author
    Image.find_by("id", @attributes["post_id"])
  end
end