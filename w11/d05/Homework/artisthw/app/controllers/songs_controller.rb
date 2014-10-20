class SongsController < ApplicationController

	def index
    render(:index, { locals: { songs: Song.all(), artists: Artist.all } })
	end

	def create
    Song.create(name: params[:name], artist_id: params[:artist_id])

		redirect_to '/songs'
	end

	def show
			song = Song.find_by({id: params[:id]})
			artist = Artist.find_by({id: song.artist_id})
    	
    	render(:show, { locals: { song: song, artist: artist } })
	end

  def update
    song = Song.find(params[:id])
    @artists = Artist.all()


    song.update(name: params[:name], artist_id: params[:artist_id])

    redirect_to '/songs'
  end

  def destroy
    song = Song.find(params[:id])

    song.destroy

    redirect_to '/songs'
  end	  

###
end

