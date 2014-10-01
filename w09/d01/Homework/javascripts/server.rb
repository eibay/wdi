require("httparty")
require("sinatra")
require("sinatra/reloader")


get("/goodreads/:title")do 

	info = HTTParty.get("https://www.goodreads.com/search.xml?key=8FCPxuIq7Jyaa64Im0IP4Q&q=#{params[:title]}")
	rating = info["GoodreadsResponse"]["search"]["results"]["work"][0]["average_rating"] 
	return rating.to_JSON
end