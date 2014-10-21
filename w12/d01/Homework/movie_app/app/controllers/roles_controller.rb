class RolesController < ApplicationController
	def index
		roles = Role.all
		
		respond_to do |format|
			format.json {render :json => roles}
		end
	end

	def create
		role = {character_name: params["character_name"],
		movie_id: params["movie_id"],
		actor_id: params["actor_id"]
		}
		Role.create(role)
		render :json => role
	end

	def update
		role = Role.find(params["id"])
		role.update({
		character_name: params["character_name"],
		movie_id: params["movie_id"],
		actor_id: params["actor_id"]
		})
		render :json => role
	end

	def destroy
		role = Role.find(params["id"])
		role.destroy
		render :json => role	
	end
end