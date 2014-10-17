class Song < ActiveRecord::Base
	self.has_one(:artist)
end