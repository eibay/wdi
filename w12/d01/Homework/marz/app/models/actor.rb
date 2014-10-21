class Actor < ActiveRecord::Base
  has_many :roles
  has_many :movies
  validates :fname, :lname, presence: true
end
