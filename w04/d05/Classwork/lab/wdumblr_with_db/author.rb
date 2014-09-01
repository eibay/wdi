require_relative './model'

class Author < Model
  def entry
    Author.find_by("id", @attributes["author_id"])
  end
end