class ArtistsController < ApplicationController 
  def index 
    @artists = Artist.all 
  end 

  def view 
    @artist = Artist.find_by_id params[:id]
  end 
end 