class ActorsController < ApplicationController

	def index 
		@actors = Actor.all

		respond_to do |format|
			format.json { render :json => @actors}	
		end
	end

	def create
		@actor = Actor.create({fname: params[:fname], lname: params[:lname], picture_url: params[:picture_url]})
		
		respond_to do |format|
			format.json { render :json => @actor}
		end
	end

	def show
		

end