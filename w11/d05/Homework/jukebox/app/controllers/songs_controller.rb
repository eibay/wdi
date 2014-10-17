class SongsController < ApplicationController

	def index
		render(:index, { locals: {songs: Song.all, artists: Artist.all} })
	end

	def create
		song = {name: params[:name], artist_id: params[:artist_id]}
		Song.create(song)
		redirect_to "/songs"
	end

	def destroy
		Song.find(params[:id]).destroy
		redirect_to "/songs"
	end

	def show
		song = Song.find(params[:id])
		render(:show, { locals: {song: song, artists: Artist.all} })
	end

	def update
		song = Song.find(params[:id])
		song.update({name: params[:name], artist_id: params[:artist_id]})
		redirect_to "/songs"
	end

end