require 'sinatra' 
require 'json'  
require 'httparty' 


get("/") do  
	erb(:index)
end

get("/movie/:title") do
	movie_title = params["title"]
	image = HTTParty.get("http://www.omdbapi.com/?t=#{mov_title}")
	# http://www.omdbapi.com/?t=True%20Grit&y=1969
	 # http://www.omdbapi.com/?t=True Grit&y=1969):

	# images.to_json
end


movie_title = "True Grit"
url = URI.encode("http://www.omdbapi.com/?t=#{movie_title}")
movie = HTTParty.get(url)
movie_array = JSON.parse(movie)
movie_poster_url = movie_array["Poster"]

