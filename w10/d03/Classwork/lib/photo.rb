class Photo < ActiveRecord::Base

	self.belongs_to(:albums)

end