class ActorsController < ApplicationController

	def index 
		@actors = Actor.all

		respond_to do |format|
			format.json { render :json => @actors}	
		end
	end

	def create
		params = JSON.parse(request.body.read)[0]
		@actor = Actor.create({fname: params[:fname], lname: params[:lname], picture_url: params[:picture_url]})
		
		respond_to do |format|
			format.json { render :json => @actor}
		end
	end

	def show
		@actor = Actor.find(params[:id])

		respond_to do |format|
			format.json { render :json => @actor, :include => [:movies, :roles]}
		end
	end

end