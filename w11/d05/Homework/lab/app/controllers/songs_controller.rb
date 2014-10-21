class SongsController < ApplicationController
	def index
		render(:index, { locals: { songs: Song.all() } })
	end

	def show
		song = Song.find(params[:id])
		render(:show, { locals: { song: song } })
	end

	def create
		song = Song.create(name: params[:name], artist_id: params[:artist_id])
		redirect_to '/artists/' + params[:artist_id]
	end

	def create
		song = Song.create(name: params[:name], artist_id: params[:artist_id])
		redirect_to '/artists/' + params[:artist_id]
	end

	def destroy
		song = Song.find(params[:id])
		song.destroy
		redirect_to '/artists/' + params[:artist_id]
	end	
end