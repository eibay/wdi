class ArtistsController < ApplicationController

	def index
		@artists=Artist.all
	end
	def create
		Artist.create({name:params[:name][:attr], genre:params[:genre][:attr], number_of_albums: params[:albums][:attr]})
		redirect_to '/'
	end
	def show
		@artist = Artist.find(params[:id])
	end




end