require 'active_record'

class Category < ActiveRecord::Base
  def albums
    Album.where({category_id: self.id})
  end
end
