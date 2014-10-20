class SuperherosController < ApplicationController

	#HTTParty.get('http://localhost:3000/superheros.json')
	def index
		superheros = Superhero.all

		respond_to do |format|
			format.json { render :json => superheros }
		end
	end

	#Good input
	#HTTParty.post('http://localhost:3000/superheros.json', :body => {name: "sean", real_identity: "john"})
	#Bad input
	#HTTParty.post('http://localhost:3000/superheros.json', :body => {name: "sean"})  
	def create
		superhero = Superhero.create(name: params["name"], age: params["age"], real_identity: params["real_identity"], powers: params["powers"], city_id: params["city_id"])

		respond_to do |format|
			format.json do
				if superhero.valid_superhero?
					render :json => superhero
				else
					render :json => "Bad input!".to_json
				end
			end
		end
	end

	#Good input
	#HTTParty.put('http://localhost:3000/superheros/1.json', :body => {name: "sean", real_identity: "john"})
	#Bad input
	#HTTParty.put('http://localhost:3000/superheros/1.json', :body => {name: "sean"})  
	def update
		superhero = Superhero.find(params[:id])
		superhero.update(name: params["name"], age: params["age"], real_identity: params["real_identity"], powers: params["powers"], city_id: params["city_id"])

		respond_to do |format|
			format.json do
				if superhero.valid_superhero?
					render :json => superhero
				else
					render :json => "Bad input!".to_json
				end
			end
		end
	end

end