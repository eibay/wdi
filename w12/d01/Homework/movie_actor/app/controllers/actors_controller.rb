class ActorsController < ApplicationController

	#HTTParty.get('http://localhost:3000/actors.json')
	def index
		actors = Actor.all

		respond_to do |format|
			format.json { render :json => actors }
		end
	end

# HTTParty.post('http://localhost:3000/actors.json', :body => {fname: "Mark", lname: "Ruffalo", picture_url: "xxx"})
	def create
		actor = Actor.create(
			fname: params["fname"], 
			lname: params["lname"], 
			picture_url: params["picture_url"]
			)

		respond_to do |format|
			actor.save
			format.json { render :json => actor }
		end
	end

	def update
		actor = Actor.find(params[:id])
		actor.fname = params["fname"]
		actor.lname = params["lname"]
		actor.picture_url = params["picture_url"]

		respond_to do |format|
			actor.save
			format.json { render :json => actor }
		end
	end







end