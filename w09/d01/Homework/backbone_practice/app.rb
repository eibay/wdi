require "sinatra"
require "sinatra/reloader" if development?
require "httparty"

require 'sinatra/cross_origin'

configure do
  enable :cross_origin
end

get "/rating/:author/:title" do
	response  = HTTParty.get("https://www.goodreads.com/book/title.xml?author=#{params[:author]}&key=AwFbcVEoMR28ER1w8Xjg&title=#{params[:title]}")
	response.parsed_response["GoodreadsResponse"]["book"]["average_rating"]
end