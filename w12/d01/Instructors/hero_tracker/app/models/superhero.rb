class Superhero < ActiveRecord::Base
<<<<<<< HEAD

=======
  validates :name, :real_identity, presence: true
	belongs_to :city
>>>>>>> 3a689f257e9f8c7e7ba303a0358d69a62effe06b
end