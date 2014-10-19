class ArtistsController < ApplicationController 
  def index 
    @artists = Artist.all 
  end 

  def view 
    @artist = Artist.find_by_id params[:id]
    @albums = Album.find_by :artist_id, params[:id] 
  end 

  def create 
    Artist.create :name => params["name"], :genre => params["genre"], :number_of_albums => params["number_of_albums"] 
    redirect_to :index 
  end 
end 