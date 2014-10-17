class PuppiesController < ApplicationController
	def new
  	end
  	def create
  		@puppy = Puppy.new(params[:puppy])
 
  		@puppy.save
  		redirect_to @puppy
  	end
end