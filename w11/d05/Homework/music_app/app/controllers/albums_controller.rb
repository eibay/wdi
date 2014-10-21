class AlbumsController < ApplicationController
	
	def index
		render(:index, {locals: {albums: Album.all}})
	end

	def create
		Album.create({
			name: params["name"],
			artist_id: params["artist_id"]
			})
		redirect_to "/albums"
	end

	def show
		render(:show, {locals: {album: Album.find(params[:id])}})
	end

	def update
		album = Album.find(params[:id])
		album.update({name: params["name"], artist_id: params["artist_id"]})
		redirect_to "/albums"
	end

	def destroy
		album = Album.find(params[:id])
		album.destroy
		redirect_to "/albums"
	end

end