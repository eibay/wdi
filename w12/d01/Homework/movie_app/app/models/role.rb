class Role < ActiveRecord::Base
	validates :character_name, :movie_id, :actor_id, presence: true

end