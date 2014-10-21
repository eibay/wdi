require 'httparty'
require 'musicbrainz'

class ArtistsController < ApplicationController
	def index
		render(:index, { locals: { artists: Artist.all(), songs: Song.all() } })
	end

	def show
		artist = Artist.find(params[:id])
		songs = Song.where(artist_id: params[:id])
		name_json = URI::encode(artist.name)
		brainz = MusicBrainz::Client.new(:username => 'username', :password => 'password')	
		mb_id = brainz.artist(:query => artist.name)["artist_list"]["artist"][0]["id"]
		artist_info = brainz.artist(:mbid => mb_id, :inc => 'artist-rels')
		# name = artist_info["artist"]["name"]
		disambiguation = artist_info["artist"]["disambiguation"]
		country = artist_info["artist"]["country"]

		# response = HTTParty.get('http://musicbrainz.org/ws/2/artist/?query=artist:' + name_json + '&fmt=json')
		# mb_id = response["artists"][0]["id"]
		# response = HTTParty.get('http://musicbrainz.org/ws/2/artist/' + mb_id + '?inc=aliases&fmt=json')
		# binding.pry
		render(:show, { locals: { artist: artist, songs: songs, country: country, disambiguation: disambiguation } })
	end

	def create
		name_json = URI::encode(params[:name])
		artist = Artist.create(name: params[:name], genre: params[:genre], number_of_albums: params[:album])
		redirect_to '/artists'
	end

	def edit
		artist = Artist.find(params[:id])
		render(:edit, { locals: { artist: artist } })
	end

	def update
		artist = Artist.find(params[:id])
		artist.name = params[:name]
		artist.genre = params[:genre]
		artist.number_of_albums = params[:number_of_albums]
		artist.save
		redirect_to '/artists/' + params[:id]
	end

	def destroy
		artist = Artist.find(params[:id])
		songs = Song.where(artist_id: params[:id])
		songs.each do |song|
			song.destroy
		end
		artist.destroy
		redirect_to '/artists'
	end	
end