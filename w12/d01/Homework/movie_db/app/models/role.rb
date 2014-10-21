class Role < ActiveRecord::Base
	validates :character_name, :movie_id, :actor_id, presence: true
	belongs_to :actor
	belongs_to :movie
end