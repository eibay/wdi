class ArtistsController < ApplicationController

	def index
		@artists = Artist.all
	end

	def create
		Artist.create({name: params[:name], genre: params[:genre], number_of_albums: params[:number_of_albums] })
		
		redirect_to "/artists"
	end 

	def show
		artist = Artist.find(params["id"])
		render(:show, locals:{ artist: artist })
	end 

	def update
		artist = Artist.find(params["id"])
		artist.name = params["name"]
		artist.genre = params["genre"]
		artist.number_of_albums = params["number_of_albums"].to_i
		artist.save()

		redirect_to "/artists"
	end 

	def destroy 
		artist = Artist.find(params["id"])

		songs = artist.songs
		songs.each do |song|
			song.destroy()
		end 

		artist.destroy()
		redirect_to "/artists"
	end 

end