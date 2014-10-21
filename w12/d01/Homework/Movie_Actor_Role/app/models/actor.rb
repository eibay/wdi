class Actor < ActiveRecord::Base
	validates :fname, :lname, presence: true
	has_many :role
end