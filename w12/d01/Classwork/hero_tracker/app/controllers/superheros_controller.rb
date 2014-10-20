# HTTParty.post("http://localhost:3000/superheros.json", :body => {"name" => " ", "real_identity" => "Bobby", "powers" => "building shit", "age" => 30, "city_id:" => 1})
# HTTParty.put('http://localhost:3000/superheros/1.json', :body => {name: "sean", real_identity: "john"})

class SuperherosController < ApplicationController

	def index
		superheros = Superhero.all
		respond_to do |format|
			format.json { render :json => superheros }
		end
	end

	def create
		if params["name"] == " " || if params["real_identity"] == " "
			respond_to.do |format|
			format.json { render :json => "BAD FORMAT!".to_json }
		end

		else
			new_superhero = Superhero.create(
				name: params["name"],
				real_identity: params["real_identity"],
				powers: params["powers"],
				age: params["age"],
				city_id: params["city_id"]
			)
			respond_to do |format|
				format.json { render :json => new_superhero }
		 end
	 	end
 	end

	def update
		superhero = Superhero.find(params[:id])
		superhero.update(
			name: params["name"],
			real_identity: params["real_identity"],
			powers: params["powers"],
			age: params["age"],
			city_id: params["city_id"]
		)
		respond_to do |format|
			format.json { render :json => superhero }
		end
	end


	def destroy
		superhero = Superhero.find(params[:id])
		superhero.destroy
	end

###
end