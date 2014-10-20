class SongController < ApplicationController

  def index
    artist = Artist.all
    render :index, locals {artist: artist}
  end

  def create
    binding.pry
    song = Song.create({name: params["song_title"], artist_id: params["artist.id"]})
    render :index
  end

end
