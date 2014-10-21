class ActorsController < ApplicationController
	def index
		actors = Actor.all

		respond_to do |format|
			format.json { render :json => actors }
		end
	end

	def create
		actor = Actor.create({fname: params["fname"], lname: params["lname"], picture_url: params["picture_url"]})

		respond_to do |format|
			format.json { render :json => actor }
		end
	end

	def update
		actor = Actor.find(params["id"])
		actor.fname = params["fname"]
		actor.lname = params["lname"]
		actor.picture_url = params["picture_url"]

		respond_to do |format|
			format.json do
				if actor.valid?
					actor.save
					render :json => actor
				else
					render :json => actor.errors.messages.to_json
				end
			end
		end
	end

	def destroy
		actor = Actor.find(params["id"])
		actor.destroy
	end
end