class SongsController < ApplicationController

def create

	artist = Artist.find_by(params[:id])
	Song.create(name: params[:name], artist_id: artist.id)

	redirect_to '/artists'
end


end