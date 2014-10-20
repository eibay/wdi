class SuperherosController < ApplicationController

	def index
		superheros = Superhero.all

		respond_to do |format|
			format.json { render :json => superheros }
		end
	end

	def create
		superhero = Superhero.create(name: params["name"], age: params["age"], real_identity: params["real_identity"], powers: params["powers"], city_id: params["city_id"])

		respond_to do |format|
			format.json { render :json => superhero }
		end
	end

	


end