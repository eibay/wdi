require 'sinatra'
require "pry"
require "json"
require "open-uri"
require "nokogiri"

get("/reddit") do 
	response = Nokogiri::HTML(open("http://www.reddit.com/"))

	erb(:index, {locals: {json_hash: json_hash}})
end