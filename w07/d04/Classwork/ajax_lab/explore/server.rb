require 'sinatra'
require 'json' 
require 'httparty'


# route to variable "movie_title"  params["movie_title"] is movie entered ex. http://127.0.0.1:4567/inception
get '/:movie_title' do
  content_type :json

  url = URI.encode("http://www.omdbapi.com/?t=#{params[:movie_title]}") # sets up the parameters of the to-be request  
  movie = HTTParty.get(url) # sends the request using HTTParty. waits for response before moving on 

  movie.response.body # once response is recieved back from OMDB, this displays the responce's body 
end