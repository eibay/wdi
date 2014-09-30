require 'pry'
require 'sinatra'
require 'sinatra/reloader'
require 'json'
require 'httparty'
require 'uri'
require_relative './lib/connection'
require_relative './lib/movie'

after do
	ActiveRecord::Base.connection.close
end

get('/') do
	erb(:index)
end
get('/books') do
	content_type :json
	title=params[:title]
	title=title.split(' ')
	title=title.join('+')
	url=URI.encode("https://www.goodreads.com/book/title?title=#{title}&key=mLCTndmzBybvikI6Zmer5g")
	api=HTTParty.get(url)
	response={rating: api["GoodreadsResponse"]["book"]["average_rating"]}
	response.to_json
end
post('/movies') do
	content_type :json
	title=JSON.parse(params["data"])
	title=title["title"]
	movie= Movie.new
	movie.title=title
	movie.save
	response={title: title}
	response.to_json
end
get('/movies') do
	content_type :json
	movies=[]

	Movie.all.each do |movie|
		movies.push(movie.title)
	end
	movies.to_json
end
get('/deletemovie') do
	content_type :json
	movie=Movie.find_by(title: params["title"])
	movie.destroy

	{response: 'Successfully Deleted'}.to_json


	# response={hash:{hash:{hash:{hash:{}, hash2:{}, hash3:{}}}}}

end















