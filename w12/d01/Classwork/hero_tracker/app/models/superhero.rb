class Superhero < ActiveRecord::Base

	self.belongs_to(:city)
	validates :name, presence: true
	validates :real_identity, presence: true

end