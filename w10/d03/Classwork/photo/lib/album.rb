require 'active_record'

class Album < ActiveRecord::Base
  self.has_many(:photos)
  #adds an instance methods that gets the photos!!!
  #this is an active record thing
  #is the same as
  #def photos
  #Photos.where({album_id: self.id})
  #end

end