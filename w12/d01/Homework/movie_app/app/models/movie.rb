class Movie < ActiveRecord::Base
	validates :title, :year, :poster_url, presence: true

end