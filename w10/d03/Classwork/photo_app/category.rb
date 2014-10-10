require 'active_record'

class Category < ActiveRecord::Base
  def album
    Album.where({album_id: id})
  end
end
