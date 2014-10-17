class SongsController < ApplicationController
  def index
    render(:index, { locals: { songs: Song.all } })
  end

  def create
    Song.create(name: params[:name])
    redirect_to '/songs'
  end

  def show
    render(:show, {locals: {song: Song.find(params[:id]) }})
  end

  def update
    song = Song.find(params[:id])
    song.update(name: params[:name])
    redirect_to '/songs'
  end

  def destroy
    song = Song.find(params[:id])
    song.destroy
    redirect_to '/songs'
  end
end