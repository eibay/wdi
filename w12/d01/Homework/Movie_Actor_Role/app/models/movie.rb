class Movie < ActiveRecord::Base
	validates :title, :year, presence: true
	has_many :role
end