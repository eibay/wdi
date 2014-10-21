class RolesController < ApplicationController

	#HTTParty.get('http://localhost:3000/roles.json')
	def index
		roles = Roles.all

		respond_to do |format|
			format.json { render :json => roles }
		end
	end

	#Good input
	#HTTParty.post('http://localhost:3000/roles.json', :body => {character_name: "Michael Corleone", movie_id: 3, actor_id: 1})
	#Bad input
	#HTTParty.post('http://localhost:3000/roles.json', :body => {title: "The Godfather"})  
	def create
		role = Role.new(character_name: params["character_name"], movie_id: params["movie_id"], actor_id: params["actor_id"])

		respond_to do |format|
			format.json do
				if role.valid?
					role.save
					render :json => role
				else
					render :json => role.errors.messages.to_json
				end
			end
		end
	end

	#Good input
	#HTTParty.put('http://localhost:3000/movies/1.json', :body => {name: "sean", real_identity: "john"})
	#Bad input
	#HTTParty.put('http://localhost:3000/movies/1.json', :body => {name: "sean"})  
	def update
		role = Role.find(params[:id])
		role.character_name = params["character_name"]
		role.movie_id = params["movie_id"]
		role.actor_id = params["actor_id"]

		respond_to do |format|
			format.json do
				if role.valid?
					role.save
					render :json => role
				else
					render :json => role.errors.messages.to_json
				end
			end
		end
	end

end
