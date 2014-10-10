class Photo < ActiveRecord::Base
end

class Category < ActiveRecord::Base
end

class Album < ActiveRecord::Base
  # self.has_many(:photos)

  # def photos
  #   Photo.where({album_id: self.id })
  # end
end

class Client < ActiveRecord::Base
end