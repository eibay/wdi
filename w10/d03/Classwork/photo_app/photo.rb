require 'active_record'

class Photo < ActiveRecord::Base
  def album
    Album.find_by({id: album_id})
  end
end