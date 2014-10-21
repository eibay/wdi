class Role < ActiveRecord::Base
  belongs_to :actor
  belongs_to :movie
  validates :character_name, :movie_id, presence: true
end
