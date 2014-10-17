class SongsController < ApplicationController

	def create
		Song.create({name: params[:song][:name], artist_id: params[:artist_id]})
		redirect_to request.referrer
	end

	def show
		@song = Song.find(params[:id])
	end

	def destroy
		@song = Song.find(params[:id])
		@song.destroy()
		redirect_to request.referrer
	end

	def update
		@song = Song.find(params[:id])
		@song.update(name: params[:name])
		redirect_to request.referrer
	end
	
end