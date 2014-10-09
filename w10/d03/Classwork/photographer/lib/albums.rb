class Album < ActiveRecord::Base
	self.has_many(:photos)
end