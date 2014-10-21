class Movie < ActiveRecord::Base
  has_many :actors
  has_many :roles
  validates :title, presence: true
end
