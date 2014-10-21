class Song < ActiveRecord::Base
	self.belongs_to(:artist)
end