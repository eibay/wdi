class ActorsController < ApplicationController
	def index
		actors = Actor.all
		
		respond_to do |format|
			format.json {render :json => actors}
		end
	end

	def create
		actor = {fname: params["fname"],
		lname: params["lname"],
		picture_url: params["picture_url"]
		}
		Actor.create(actor)
		render :json => actor
	end

	def update
		actor = Actor.find(params["id"])
		actor.update({fname: params["fname"],
			lname: params["lname"],
			picture_url: params["picture_url"]})
		render :json => actor
	end

	def destroy
		actor = Actor.find(params["id"])
		actor.destroy
		render :json => actor	
	end
end