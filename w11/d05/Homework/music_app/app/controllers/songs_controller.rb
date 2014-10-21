class SongsController < ApplicationController

	def create
		Song.create({
			name: params["name"],
			artist_id: params["artist_id"],
			album_id: params["album_id"]
			})
		redirect_to "/albums/#{album_id}"
	end

	def show
		render(:show, {locals: {song: Song.find(params[:id])}})
	end

	def update
		song = Song.find(params[:id])
		song.update({name: params["name"], artist_id: params["artist_id"], album_id: params["album_id"]})
		redirect_to "/albums/#{album_id}"
	end

	def destroy
		song = Song.find(params[:id])
		song.destroy
		redirect_to "/albums/#{album_id}"
	end

end