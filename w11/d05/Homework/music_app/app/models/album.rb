class Album < ActiveRecord::Base
	self.has_many :songs

	self.belongs_to :artist
end