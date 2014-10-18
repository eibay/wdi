class SongsController < ApplicationController
	def index
		@songs = Song.all()
		@artists = Artist.all()
	end

	def create
		Song.create(name: params[:name], artist_id: params[:artist_id])
		
		redirect_to '/songs'
	end

	def show
		song = Song.find(params[:id])
		@artists = Artist.all()
		render(:show, { locals: { song: Song.find(params[:id]) } })
	end

	def update
		song = Song.find(params[:id])
		# @artist = Artist.find(params[:id])
		@artists = Artist.all()

		song.update(name: params[:name], artist_id: params[:artist_id])
	
		redirect_to '/songs'
	end

	def destroy
		song = Song.find(params[:id])

		song.destroy

		redirect_to '/songs'
	end
end
