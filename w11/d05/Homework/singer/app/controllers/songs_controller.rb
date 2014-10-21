class SongsController < ApplicationController

	def create
		Song.create({name: params[:song][:name], artist_id: params[:artist_id]})
		redirect_to request.referrer	
	end

	def show
		@song = Song.find(params[:id])
	end

	def update
		@song = Song.find(params[:id])
		@song.update(name: params[:song][:name])
		redirect_to "/artists/#{@song.artist_id}"		
	end

	def destroy
		@song = Song.find(params[:id])
		@song.destory()
		redirect_to "/artists/#{@song.artist_id}"
	end
	
end