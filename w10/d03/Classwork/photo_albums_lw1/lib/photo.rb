require 'active_record'

class Photo < ActiveRecord::Base
  def album
    Album.find_by({id: self.album_id})
  end
end
