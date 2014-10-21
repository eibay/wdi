class Superhero < ActiveRecord::Base
	belongs_to :city

	validates :name, :real_identity, presence: true

end