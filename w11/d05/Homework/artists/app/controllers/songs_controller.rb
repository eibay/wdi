class SongsController < ApplicationController

	def create
		Song.create(name: params[:name], artist_id: params[:artist_id])

		redirect_to :back
	end

	def show
		render(:show, { locals: { song: Song.find(params[:id]) } })
	end

	def update
		song = Song.find(params[:id])

		song.update(name: params[:name])

		render(:show, { locals: { song: song } })
	end

	def destroy
		song = Song.find(params[:id])

		song.destroy

		# artist = Artist.where(id = params[:artist_id])
		redirect_to '/artists'
	end

end