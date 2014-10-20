class SongsController < ApplicationController
	def index
		render(:index, { locals: { songs: Song.all } })
	end

  def create
    artist = Artist.find_by(name: params[:artist_name])
    Song.create(name: params[:name], artist_id: artist.id)
  
    redirect_to '/songs'
    ### AUTOMATICALLY assumes render(:create)
  end

  def show
    song = Song.find(params[:id])
    the_artist = song.artist[:name]

    # binding.pry
    render(:show, { locals: { song: Song.find(params[:id]), the_artist: the_artist } })
  end

  def update
    song = Song.find(params[:id])

    song.update(name: params[:name], artist_id: song.artist_id)

    redirect_to '/songs'
  end

  def destroy
    song = Song.find(params[:id])

    song.destroy

    redirect_to '/songs'
  end
end