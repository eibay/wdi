class ArtistsController < ApplicationController

	def index
		render(:index, { locals: { artists: Artist.all } })
	end

	def create
		# require 'open-uri'
		# artist_query = params[:brainz_name]

		# response = HTTParty.get("http://musicbrainz.org/ws/2/artist/?query=artist:#{artist_query}&inc=recordings&fmt=json", headers: {"User-Agent" => "Httparty"})

		# name = response["artists"][0]["name"]

		# brainz_id = response["artists"][0]["id"]

		# recordings = HTTParty.get("http://musicbrainz.org/ws/2/artist/#{brainz_id}?inc=release-groups&fmt=json", headers: {"User-Agent" => "Httparty"})

		# recordings["release-groups"][0]["title"]

		Artist.create(name: params[:name], genre: params[:genre], number_of_albums: params[:number_of_albums], photo_url: params[:photo_url])

		redirect_to '/artists'
	end

	def show

		render(:show, { locals: { artist: Artist.find(params[:id]) } })
	end

	def update
		artist = Artist.find(params[:id])

		artist.update(name: params[:name], genre: params[:genre], number_of_albums: params[:number_of_albums], photo_url: params[:photo_url])

		redirect_to '/artists'
	end

	def destroy
		artist = Artist.find(params[:id])
		songs = Song.where(artist_id: artist.id)

		songs.each do |song|
			song.destroy
		end

		artist.destroy

		redirect_to '/artists'
	end



end


# response = HTTParty.get("http://musicbrainz.org/ws/2/artist/?query=artist:the%20fall&inc=recordings&fmt=json", headers: {"User-Agent" => "Httparty"})

# name = response["artists"][0]["name"]

# brainz_id = response["artists"][0]["id"]

# recordings = HTTParty.get("http://musicbrainz.org/ws/2/artist/d5da1841-9bc8-4813-9f89-11098090148e?inc=release-groups&fmt=json", headers: {"User-Agent" => "Httparty"})

# recordings["release-groups"][0]["title"]


