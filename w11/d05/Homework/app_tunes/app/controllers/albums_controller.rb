class AlbumsController < ApplicationController
  def view 
    @album = Album.find_by_id params[:id]
    @songs = Song.find_by :album_id, params[:id]
  end  
end 