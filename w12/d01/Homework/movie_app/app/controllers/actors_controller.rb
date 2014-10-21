class ActorsController < ApplicationController
	
	def index
		@actors = Actor.all

		render json: @actors, :include => {:movies => {:include => :roles}}
	end

	def create
		@actor = Actor.create(fname: params[:fname], lname: params[:lname], picture_url: params[:picture_url])
		@role = Role.create(character_name:params[:character_name], actor_id:@actor.id, movie_id: params[:movie_id])

		render json: @actor, :include => :roles
	end

	def show
		@actor = Actor.find(params[:id])
		render json: @actor, :include => {:actors => {:include => :roles }}
	end

		def update
		@actor = Actor.update(fname: params[:fname], lname: params[:lname], picture_url: params[:picture_url])
		render json: @actor
	end

	def destroy
		Actor.find(params[:id]).destroy
		render json: {response: 'item deleted'}
	end

end


