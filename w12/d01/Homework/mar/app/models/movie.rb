class Movie < ActiveRecord::Base
	validates :title, :year, presence: true
	has_many :actors, through: :roles
	has_many :roles
end