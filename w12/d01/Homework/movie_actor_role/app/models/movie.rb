class Movie < ActiveRecord::Base
	validates :title, :year, :poster_url, presence: true
	has_many :roles
end