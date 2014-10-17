class ArtistsController < ApplicationController

	def index
		render(:index, { locals: { artists: Artist.all } })
	end

	def create
		Artist.create(name: params[:name], genre: params[:genre], number_of_albums: params[:number_of_albums], photo_url: params[:photo_url])

		redirect_to '/artists'
	end










end