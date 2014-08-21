require 'pry'
require 'HTTParty'
require 'sinatra'
require 'geocoder'

get("/") do 
	erb(:index)
end

get("/tag") do
	tag = request.params["search"]
	response = HTTParty.get("https://api.instagram.com/v1/tags/#{tag}/media/recent?client_id=8fe4db31e3a940068664c1e7e3c5c061")
	
	picArr = []
	
	response["data"].each do |x| picArr<<"<li><img src='#{x["images"]["standard_resolution"]["url"]}'></li>" end
	
	pics = "<div><ul>" + picArr.join('') + "</ul></div>"

	erb(:results, {locals: { tag: tag, pics: pics}})
end

get("/lat") do
	
	lat = request.params["lat"]
	long = request.params["long"]
	
	response = HTTParty.get("https://api.instagram.com/v1/media/search?lat=#{lat}&lng=#{long}&client_id=8fe4db31e3a940068664c1e7e3c5c061")
	picArr = []
	
	response["data"].each do |x| picArr<<"<li><img src='#{x["images"]["thumbnail"]["url"]}'></li>" end
	pics = "<div><ul>" + picArr.join('') + "</ul></div>"
	
	erb(:results, {locals: {tag: "stuff near #{lat}, #{long}!", pics: pics}})
end

get("/city") do

	location = request.params["city"]
	location = location.gsub(" ", "+")

	googresponse = HTTParty.get("https://maps.googleapis.com/maps/api/geocode/json?address=#{location}&key=AIzaSyCUDbbdZqgnvYm0LmOJAXlm_lJKTOERRYg")
	
	lat = googresponse["results"][0]["geometry"]["location"]["lat"]
	long = googresponse["results"][0]["geometry"]["location"]["lng"]
	
	response = HTTParty.get("https://api.instagram.com/v1/media/search?lat=#{lat}&lng=#{long}&client_id=8fe4db31e3a940068664c1e7e3c5c061")
	
	picArr = []
	response["data"].each do |x| picArr<<"<li><img src='#{x["images"]["standard_resolution"]["url"]}'></li>" end
	pics = "<div><ul>" + picArr.join('') + "</ul></div>"
	
	erb(:results, {locals: {tag: request.params["city"], pics: pics}})
end








