class SongsController < ApplicationController

	def create
		Song.create({name: params[:song][:name], artist_id:params[:artist_id]})
		redirect_to request.referrer
	end
	def viewall
		@songs = Song.all
	end

	def index
		@songs = Song.where(artist_id: params[:artist_id])
		@artist = Artist.find(params[:artist_id])
	end
	def destroy
		Song.find(params[:id]).destroy
		redirect_to request.referrer
	end
end