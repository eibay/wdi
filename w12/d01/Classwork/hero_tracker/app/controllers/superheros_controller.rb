class SuperherosController < ApplicationController

	def index
		superheros = Superhero.all

		respond_to do |format|
			# format.html { render "hello world" }
			format.json { render :json => superheros }
		end
	end

	def create

		new_hero = Superhero.create(name: params[:name], real_identity: params[:real_identity], powers: params[:powers], age: params[:age], city_id: params[:city_id])

		respond_to do |format|
			format.json { render :json => new_hero) }
		end
	end

end

# response = HTTParty.post("http://localhost:3000/superheros.json", :body => {
#     "name" => "Wonder Woman",
#     "real_identity" => "Diana Prince", 
#     "powers" => "Invisible car", 
#     "age" => 25,
#     "city_id" => 1
#     })

HTTParty.post("http://localhost:3000/superheros.json", :body => {"name" => "Robin", "age" => 17, "powers" => "none", "city_id" => 1})