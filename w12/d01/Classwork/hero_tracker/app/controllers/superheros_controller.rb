class SuperherosController < ApplicationController

	def index
		superheros = Superhero.all
		
		respond_to do |format|
			format.json {render :json => superheros}
		end
	end

	def create
		superhero = {name: params["name"],
		real_identity: params["real_identity"],
		powers: params["powers"],
		age: params["age"],
		city_id: params["city_id"]}

		respond_to do |format|
			format.json do
				if superhero.valid_superhero?
					superhero.save
					render :json => superhero
				else
					render :json => "Bad input!".to_json
				end
			end
		end
	end

	def update
		superhero = Superhero.find(params[:id])
		superhero.update({name: params["name"], age: params["age"], real_identity: params["real_identity"], powers: params["powers"], city_id: params["city_id"]})

		respond_to do |format| 
			format.json {render :json => superhero}
		end
	end
end