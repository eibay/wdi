class DogsController < ApplicationController


	def index
		@puppies=Puppy.all
	end
	def create
		Puppy.create({name:params[:name], breed:params[:breed], cuteness:params[:cuteness].to_i})
		redirect_to '/'
	end
	def destroy
		@puppy = Puppy.find(params[:id])
		@puppy.destroy
		redirect_to '/'
	end
	def edit
		@puppy = Puppy.find(params[:id])
	end
	def update
		@puppy = Puppy.find(params[:id])
		@puppy.name = params[:name]
		@puppy.breed = params[:breed]
		@puppy.cuteness = params[:cuteness].to_i
		@puppy.save
		redirect_to '/'
	end
end