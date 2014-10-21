class Actor < ActiveRecord::Base
 has_one :roles
 belongs_to :movie

end