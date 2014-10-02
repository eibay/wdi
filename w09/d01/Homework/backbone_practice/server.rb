require 'json'
require 'sinatra'
require 'sinatra/reloader'
require 'pry'
require 'httparty'


get('/') do



# response = HTTParty.get("")
	# erb(:index, {locals: {response: response}})
	erb(:index)
end

# response = JSON.parse(HTTParty.get("http://www.omdbapi.com/?t=#{movie_title}"))



#goodreads key: n7zdctk4yJ6t0aaiF1Nqw
#secret: pNvnQ4atHJDn8lEEkhu3SsAXeeDT8wEhUlKFp67pM
