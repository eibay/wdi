class ActorsController < ApplicationController

	#HTTParty.get('http://localhost:3000/actors.json')
	def index
		actors = Actor.all

		respond_to do |format|
			format.json { render :json => actors }
		end
	end

	#Good input
	#HTTParty.post('http://localhost:3000/actors.json', :body => {fname: "Robert", lname: "Duvall"})
	#Bad input
	#HTTParty.post('http://localhost:3000/actors.json', :body => {fname: "Al"})  
	def create
		actor = Actor.new(fname: params["fname"], lname: params["lname"], picture_url: params["picture_url"])

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

	#Good input
	#HTTParty.put('http://localhost:3000/actors/1.json', :body => {name: "sean", real_identity: "john"})
	#Bad input
	#HTTParty.put('http://localhost:3000/actors/1.json', :body => {name: "sean"})  
	def update
		actor = Actor.find(params[:id])
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

end
