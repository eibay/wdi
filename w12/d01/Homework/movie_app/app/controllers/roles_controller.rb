class RolesController < ApplicationController

	def index
		roles = Role.all
		respond_to do |format|
			format.json { render :json => roles.to_json }
		end
	end

	def create
		hash = {character_name: params["character_name"], movie_id: params["movie_id"], actor_id: params["actor_id"]}
		role = Role.create(hash)

		respond_to do |format|
			format.json do
				if role.valid?
					render :json => role.to_json
				else
					render :json => role.errors.messages.to_json
				end
			end
		end
	end

	def update
		role = Role.find(params["id"])
		role.character_name = params["character_name"]
		role.actor_id = params["actor_id"]
		role.movie_id = params["movie_id"]
		respond_to do |format|
			format.json do
				if role.valid?
					role.save
					render :json => role
				else
					render :json => role.errors.messages.to_json
				end
			end
		end
	end

	def delete
		role = Role.find(params["id"])
		role.destroy
		respond_to do |format|
			format.json { render :json => role.to_json}
		end
	end

end

# HTTParty.get("http://localhost:3000/roles")

# HTTParty.post("http://localhost:3000/roles.json", body: {"actor_id" => "13", "movie_id" => "1", "character_name" => "Ripley"})

# HTTParty.put("http://localhost:3000/roles/1.json", body: {"actor_id" => "13", "movie_id" => "1", "character_name" => "Ripley"})
