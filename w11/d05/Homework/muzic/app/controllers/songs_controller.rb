class SongsController < ApplicationController

	def index
		@songs = Song.all
		@artists = Artist.all
	end 

	def create
		if params[:artist_id] != nil 
			Song.create( { name: params[:name], artist_id: params[:artist_id] } ) 
			redirect_to "/songs"
		else render(text: "Song must have artist. Please try again")
		end 
	end 

	def show
		song = Song.find(params[:id])

		render(:show, locals: { song: song, artists: Artist.all })
	end 

	def update
		song = Song.find(params["id"])
		song.artist_id = params["artist_id"]
		song.name = params["name"]
		song.save()

		redirect_to "/songs"
	end 

	def destroy
		song = Song.find(params["id"])
		song.destroy()

		redirect_to "/songs"
	end 

end 