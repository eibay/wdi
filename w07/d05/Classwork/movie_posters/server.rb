require 'sinatra'
require 'sinatra/reloader'
require 'HTTParty'
require 'JSON'
require 'pry'

get ("/") do 
	erb(:index)
end

get ("/api/:path") do
	path = params[:path]
	movie = path.gsub(" ", "%20")

	response = HTTParty.get("http://www.omdbapi.com/?t=#{movie}")
	response = JSON.parse(response)
	poster = response["Poster"]
	puts poster


	return poster

end