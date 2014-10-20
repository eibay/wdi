class SongsController < ApplicationController

	def index
		if params[:artist_id]
			artist = Artist.where({id: params[:artist_id]})

			songs = Song.where({artist_id: params[:artist_id]})
			
			render(:index, { locals: {songs: songs, artists: artist} })
		else
			render(:index, { locals: {songs: Song.all, artists: Artist.all} })
		end
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