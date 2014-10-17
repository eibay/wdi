class ArtistsController < ApplicationController
  def index
    render(:index, { locals: { artists: Artist.all } })
  end

  def create
    Artist.create(name: params[:name], genre: params[:genre], number_of_albums: params[:number_of_albums])

    redirect_to '/artists'
  end

  def show
    render(:show, {locals: {artist: Artist.find(params[:id]) }})
  end

  def update
    artist = Artist.find(params[:id])

    artist.update(name: params[:name], genre: params[:genre], number_of_albums: params[:number_of_albums])

    redirect_to '/artists'
  end

  def destroy
    artist = Artist.find(params[:id])
    artist.destroy

    redirect_to '/artists'
  end
end