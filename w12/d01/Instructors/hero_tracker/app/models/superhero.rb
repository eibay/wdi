class Superhero < ActiveRecord::Base
  validates :name, :real_identity, presence: true
	belongs_to :city
end