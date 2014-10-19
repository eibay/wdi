class ArtistsController < ApplicationController 
  def index 
    @artists = Artist.all 
  end 

  def view 
    @artist = Artist.find_by_id params[:id]
    @albums = Album.where :artist_id == params[:id] 
  end 

  def create 
    Artist.create :name => params["name"], :genre => params["genre"], :number_of_albums => 0 
    redirect_to :index 
  end 
end 