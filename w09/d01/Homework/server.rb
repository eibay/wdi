require 'sinatra'
require 'sinatra/reloader'
require 'HTTParty'
require 'JSON'
require 'pry'

get ("/:book") do
	book = params[:book]
	content_type :json

	url = URI.encode("https://www.goodreads.com/search.xml?key=IaCdVJ0sjdTHQI2TkozytQ&q=#{book}")
 response = HTTParty.get(url)
 puts response["GoodreadsResponse"]["search"]["results"]["work"][0]["average_rating"]
 binding.pry
 response.to_JSON
end