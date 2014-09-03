require_relative './model.rb'
require_relative './image.rb'
require "securerandom"

class Post < Model

  def self.images
    Image.select_by("post_id", post_id) # why doesn't this link?
  end



  # def self.post(key, value)
  #   self.all().select do |entity|
  #     entity[key] == value
  #   end
  # end

end
