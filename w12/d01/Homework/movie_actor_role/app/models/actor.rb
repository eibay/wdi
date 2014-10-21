class Actor < ActiveRecord::Base
	validates :fname, :lname, :picture_url, presence: true
	has_many :roles
end