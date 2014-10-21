class Actor < ActiveRecord::Base
	validates :fname, :lname, presence: true
	has_many :movies
	has_many :roles
end