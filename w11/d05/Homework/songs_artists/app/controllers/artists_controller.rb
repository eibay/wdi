class ArtistsController < ApplicationController

  def index
    @artists = Artist.all()
  end

  def new
  end

  def create
    name = params[:name]
    genre = params[:genre]
    num = params[:number]
    Artist.create({name: name, genre: genre, number_of_albums: num})
    redirect_to "/artists"
  end

  def show
    @artist = Artist.find(params[:id])
    @songs = @artist.songs
  end

  def edit
    @artist = Artist.find(params[:id])
  end

  def update
    @artist = Artist.find(params[:id])
    @artist.update(name: params[:name], genre: params[:genre], number_of_albums: params[:number])
    redirect_to '/artists'

  end

  def destroy
    @artist = Artist.find(params[:id])
    @artist.destroy
    redirect_to "/artists"
  end

end