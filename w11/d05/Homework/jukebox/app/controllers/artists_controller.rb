class ArtistsController < ApplicationController

	def index
		artists = Artist.all
		render(:index, { locals: {artists: artists} })
	end

	def show
		render(:show, { locals: {artist: Artist.find(params[:id])} })
	end

	def create
		Artist.create({name: params[:name], genre: params[:genre], number_of_albums: params[:number]})
		redirect_to "/artists"
	end

	def destroy
		Artist.find(params[:id]).destroy
		redirect_to "/artists"
	end

	def update
		artist = Artist.find(params[:id])
		artist.update({name: params[:name], genre: params[:genre], number_of_albums: params[:number]})
		redirect_to "/artists"
	end

end