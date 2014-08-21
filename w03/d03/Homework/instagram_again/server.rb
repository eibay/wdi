require 'HTTParty'
require 'pry'
require 'sinatra'



get "/" do
	erb(:index)
end

get "/tag" do
	response = HTTParty.get("https://api.instagram.com/v1/tags/#{request.params["tag"]}/media/recent?client_id=f36cce4cc31d4041bb2a387d7c015939")
	img_urls = []
	response["data"].each do |hash|
		img_urls << hash["images"]["standard_resolution"]["url"]
	end
	erb(:display, { locals: { request: request, img_urls: img_urls } })
end

get "/location" do
	response = HTTParty.get("https://api.instagram.com/v1/media/search?#{request.query_string}&client_id=f36cce4cc31d4041bb2a387d7c015939")
	img_urls = []
	response["data"].each do |hash|
		img_urls << hash["images"]["standard_resolution"]["url"]
	end
	erb(:display, { locals: { request: request, img_urls: img_urls } })
end

get "/address" do
	search = "#{request.params["city"].downcase}+#{request.params["state"].downcase}"
	search = search.gsub(" ", "+")
	geocode = HTTParty.get("https://maps.googleapis.com/maps/api/geocode/json?address=#{search}")
	lat = geocode["results"][0]["geometry"]["location"]["lat"]
	lng = geocode["results"][0]["geometry"]["location"]["lng"]
	response = HTTParty.get("https://api.instagram.com/v1/media/search?lat=#{lat}&lng=#{lng}&client_id=f36cce4cc31d4041bb2a387d7c015939")
	img_urls = []
	response["data"].each do |hash|
		img_urls << hash["images"]["standard_resolution"]["url"]
	end
	erb(:display, { locals: { request: request, img_urls: img_urls } })
end