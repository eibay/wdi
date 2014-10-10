require 'active_record'

class Client < ActiveRecord::Base
  def albums
      Album.where({album_id: self.id})
  end
end