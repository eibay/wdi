class ArtistsController < ApplicationController

  def index
    @artists = Artist.all()
  end

  def new
  end

  def create
    name = params[:name]
    Artist.create({name: name})
    redirect_to "/artists"
  end

  def show
    @artist = Artist.find(params[:id])
    @songs = @artist.songs
  end

  def edit
  end

  def update
  end

  def destroy
  end

end