class SuperherosController < ApplicationController

	def index
		@superheros = Superhero.all
		respond_to do |format|
			format.html 
			format.json {render json: @superheros}
		end
	end

	def create

		@superhero = Superhero.create(name:params[:name], city_id:params[:city_id], real_identity:params[:real_identity], age:params[:age], powers:params[:powers])
		if(@superhero.valid?)
			render json: @superhero
		else
			render json: @superhero.errors.messages
		end


	end

	def update
		@superhero = Superhero.find(params[:id])
		@superhero.update(name:params[:name], city_id:params[:city_id], real_identity:params[:real_identity], age:params[:age], powers:params[:powers])
		if(@superhero.valid?)
			render json: @superhero
		else
			render json: @superhero.errors.messages
		end
	end

	def destroy
		Superhero.find(params[:id]).destroy
		response = {response:'successfully deleted'}

		render json: response
	end


end