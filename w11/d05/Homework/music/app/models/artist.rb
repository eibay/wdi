class Artist<ActiveRecord::Base
	self.has_many(:songs, :dependent => :destroy)
end