class ArtistsController < ApplicationController

	def index
		@artists = Artist.all()
		render(:index)
	end

	def create 
		Artist.create({name: params[:name][:attr], genre: params[:genre][:attr], number_of_albums: params[:number_of_albums][:attr]})
		redirect_to '/'
	end

	def show
		@artist = Artist.find(params[:id])
		@song = Song.new()
		@songs = Song.where(artist_id: @artist.id)
	end

	def update
		@artist = Artist.find(params[:id])
		@artist.update({name: params[:artist][:name], genre: params[:artist][:genre], number_of_albums: params[:artist][:number_of_albums]})
		redirect_to request.referrer
	end

	def destroy
		@artist = Artist.find(params[:id])
		@artist.destroy()
		redirect_to '/'
	end

end