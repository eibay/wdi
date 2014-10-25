class ArtistsController < ApplicationController
	before_filter :check_session

	def index
		artist = Artist.all

		respond_to do |format|
			format.html { erb :index }
			format.json { render :json => artist}
		end
	end		

end
