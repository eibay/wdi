class Movie < ActiveRecord::Base
  has_many :actors, through: :roles
  has_many :roles,  dependent: :destroy
 
end