class RolesController < ApplicationController

	def index
		@roles = Role.all

		respond_to do |format|
			format.json { render :json => @roles }
		end
	end

	def create
		@role = Role.create({character_name: params[:character_name], actor_id: params[:actor_id], movie_id: params[:movie_id]})

		respond_to do |format|
			format.json { render :json => @role }
		end
	end

	def show
		@role = Role.find(params[:id])

		respond_to do |format|
			format.json { render :json => @role, :include => [:actor, :movie] }
		end
	end

end