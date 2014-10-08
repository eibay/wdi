require 'active_record'

class Album < ActiveRecord::Base
 

  def category
    Category.find_by({id: self.category_id})
  end

  def client
    Client.find_by({id: self.client_id})
  end
  
	self.has_many(:photos)

  # def photos
  #   Photo.where({album_id: self.id})
  # end

end
