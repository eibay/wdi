#tells ruby to load the sinatra library
require 'sinatra'
#tells ruby to load the json library
require 'json'
#tells ruby to load the httparty library
require 'httparty'

#tells ruby what to do when the route /:movie_title is sent to the server
get '/:movie_title' do
	#tells ruby which content type to expect
  content_type :json
  #sets the variable url to represent the method encode on the object URI; it takes one arguement which in this case is the url of the ombdapi with a query equal to the route's path
  url = URI.encode("http://www.omdbapi.com/?t=#{params[:movie_title]}")
  #sets a variable movie to represent the get method on HTTParty - get takes one argument which is the url set above
  movie = HTTParty.get(url)

  #sends via httparty a request to the omdbapi for information about the movie title in the route's path and returns it
  movie.response.body
#ends the code started on line 9
end