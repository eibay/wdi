class SongsController < ApplicationController

	def create
		Song.create(name: params[:name], artist_id: params[:artist_id])

		redirect_to :back
	end

	def show
		render(:show, { locals: { song: Song.find(params[:id]) } })
	end

	def update
		song = Song.find(params[:id])

		song.update(name: params[:name])

		render(:show, { locals: { song: song } })
	end

	def destroy
		song = Song.find(params[:id])
		# artist = Artist.where(id: song.artist_id)

		song.destroy

		redirect_to '/artists'
	end

end

response = HTTParty.get("http://musicbrainz.org/ws/2/artist/?query=artist:the%20fall&inc=recordings&fmt=json", headers: {"User-Agent" => "Httparty"})

response["artists"][0]["name"]                                                                             
response["artists"][0]["id"]                                                                               
# the fall d5da1841-9bc8-4813-9f89-11098090148e

recordings = HTTParty.get("http://musicbrainz.org/ws/2/artist/d5da1841-9bc8-4813-9f89-11098090148e?inc=release-groups&fmt=json", headers: {"User-Agent" => "Httparty"})

recordings["release-groups"][0]["title"]




