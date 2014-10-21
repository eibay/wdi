class Actor < ActiveRecord::Base
	has_many :movies
	has_many :roles
end