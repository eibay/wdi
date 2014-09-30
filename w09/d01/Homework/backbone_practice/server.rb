require 'sinatra'
require 'sinatra/reloader'
require 'httparty'
require 'pry'
require 'json'

get('/book/:title') do
	book = HTTParty.get('https://www.goodreads.com/book/title?format=xml&key=CZSVW6Mo6ccy1315CDfXpg&title=#{params[:title]}');
	book.to_json
end