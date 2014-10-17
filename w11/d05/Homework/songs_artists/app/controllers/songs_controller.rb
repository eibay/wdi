class SongsController < ApplicationController
def new
  @artist = Artist.find(params[:artist_id])

end

def create
  name = params[:name]
  artist_id = params[:artist_id]
  Song.create({name: name, artist_id: artist_id})
  artist = Artist.find(params[:artist_id])
  redirect_to "/artists/#{artist.id}"
end

def show
  @song = Song.find(params[:id])
  @artist = Artist.find(params[:artist_id])
end


end