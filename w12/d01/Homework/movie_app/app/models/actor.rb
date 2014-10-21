class Actor < ActiveRecord::Base
	validates :f_name, :l_name, :picture_url, presence: true

end