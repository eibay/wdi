class AlbumsController < ApplicationController

	def index
		render(:index, { locals: {albums: Album.all} })
	end

	def create
		hash = {name: params[:name][:Name], artist_id: params[:artist][:artist_id]}
		Album.create(hash)
		redirect_to("/albums")
	end

end