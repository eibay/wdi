class DogsController < ApplicationController

	def index
		@puppies = Puppy.all
	end

	def create
		Puppy.create({name: params[:name], breed: params[:breed], cuteness: params[:cuteness]})
		redirect_to '/'
	end

	def show
		@puppy = Puppy.find(params[:id])
	end

	def edit
		@puppy = Puppy.find(params[:id])
	end

	def update
		@puppy = Puppy.find(params[:id])
		@puppy.update({name: params[:name], breed: params[:breed], cuteness: params[:cuteness]})
		redirect_to "/dogs/#{@puppy.id}"
	end

	def delete
		@puppy = Puppy.find(params[:id])
		@puppy.destroy
		redirect_to '/'
	end

end