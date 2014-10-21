class RolesController < ApplicationController
	def index
		roles = Role.all

		respond_to do |format|
			format.json { render :json => roles }
		end
	end

	def create
		role = Role.create({character_name: params["character_name"], movie_id: params["movie_id"], actor_id: params["actor_id"]})
		respond_to do |format|
			format.json { render :json => role }
		end
	end

	def update
		role = Role.find(params["id"])
		role.character_name = params["character_name"]
		role.movie_id = params["movie_id"]
		role.actor_id = params["actor_id"]

		respond_to do |format|
			if role.valid?
				role.save
				render :json => role
			else
				render :json => role.errors.messages.to_json
			end
	end

	def destroy
		role = Role.find(parmas["id"])
		role.destroy
	end
end