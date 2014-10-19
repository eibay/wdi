class AlbumsController < ApplicationController
  def view 
    @album = Album.find_by_id params[:id]
    @songs = Song.where :album_id, params[:id]
  end  
end 