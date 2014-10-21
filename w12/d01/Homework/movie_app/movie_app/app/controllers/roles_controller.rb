class MoviesController < ApplicationController

	def index
		roles = Role.all()
		respond_to do |format|
			format.json { render :json => roles }
		end
	end

	def create 
		new role = Role.create(
			character_name: params["character_name"],
			movie_id: params["movie_id"],
			actor_id: params["actor_id"]
		)
		respond_to do |format|
			format.json { render :json => new_role }
		 end
	end

	def update
		role = Role.find(params[:id])
		role.update(
			character_name: params["character_name"],
			movie_id: params["movie_id"],
			actor_id: params["actor_id"]
		)
		respond_to do |format|
			format.json { render :json => role }
		end
	end

	def destroy
		role = Role.find(params[:id])
		role.destroy
	end

###
end