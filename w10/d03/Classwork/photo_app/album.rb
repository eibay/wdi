require 'active_record'

class Album < ActiveRecord::Base
  # def photos
  #   Photo.where({album_id: self.id})
  # end
  def category
    Category.find_by({id: category_id})
  end
  def client 
    Client.find_by({id: client_id})
  end

  self.has_many(:photos)


end