class Superhero < ActiveRecord::Base
	belongs_to :city
	validates :name, :real_identity, :powers, :age, :city_id, presence: true
end