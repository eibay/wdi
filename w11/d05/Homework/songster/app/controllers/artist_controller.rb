class ArtistController < ApplicationController

def index
  artists = Artist.all
  render :index, locals: { artists: artists}
end

def show
  artist = Artist.find(params[:id])
  render :show, locals: { artist: artist}
end

def create
  artist = Artist.create({name: params["artist_name"], genre: params["genre"], number_of_albums: params["albums"], picture: params["pic"]})
  render :index
end
end
