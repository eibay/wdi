class DogsController < ApplicationController


	before_filter :puppy, :except => [:index,:create]

	def puppy
		@puppy = Puppy.find(params[:id])
	end

	def index
		@puppies=Puppy.all
	end
	def create
		Puppy.create({name:params[:name], breed:params[:breed], cuteness:params[:cuteness].to_i})
		redirect_to '/'
	end
	def destroy
		@puppy.destroy
		redirect_to '/'
	end
	
	def update
		@puppy.name = params[:name]
		@puppy.breed = params[:breed]
		@puppy.cuteness = params[:cuteness].to_i
		@puppy.save
		redirect_to '/'
	end



end