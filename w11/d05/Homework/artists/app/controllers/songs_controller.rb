class SongsController < ApplicationController

	def create
		Song.create(name: params[:name], artist_id: params[:artist_id])

		redirect_to '/artists'
	end

	def show
		binding.pry
		render(:show, { locals: { song: Song.find(params[:id]) } })
	end

end