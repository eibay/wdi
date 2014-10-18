class SongsController < ApplicationController

def create

	# artist = Artist.find_by(params[:id])
	Song.create(name: params[:name], artist_id: params[:artist_id])
# binding.pry
	redirect_to '/artists'
end


end