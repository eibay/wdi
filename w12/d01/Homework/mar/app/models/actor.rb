class Actor < ActiveRecord::Base
	validates :fname, :lname, presence: true
	has_many :roles
	has_many :movies, through: :roles
end