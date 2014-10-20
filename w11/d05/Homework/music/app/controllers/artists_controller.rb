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
		@song = Song.new
		@songs = Song.where(artist_id:params[:id])
	end
	def destroy
		Artist.find(params[:id]).destroy
		redirect_to '/'
	end
	def update
		@artist = Artist.find(params[:id])
		@artist.name=params[:artist][:name]
		@artist.genre = params[:artist][:genre]
		@artist.number_of_albums = params[:artist][:albums]
		@artist.save
		redirect_to request.referrer
	end

end