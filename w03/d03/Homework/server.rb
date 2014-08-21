require 'sinatra'
require 'httparty'
require 'pry'

saved_tags = []

get("/") do
  # query = request.params["tag"]
  # tag = HTTParty.get("https://api.instagram.com/v1/tags/#{query}/media/recent?client_id=e13705fe74364dfc8f6fc9c5f562c549")
  erb(:index)
end

get("/images") do
  query = request.params["tag"]
  tag = HTTParty.get("https://api.instagram.com/v1/tags/#{query}/media/recent?client_id=e13705fe74364dfc8f6fc9c5f562c549")
  erb(:images, locals: {tag: tag})
end

post("/images") do
  query = request.params["tag"]
  tag = HTTParty.get("https://api.instagram.com/v1/tags/#{query}/media/recent?client_id=e13705fe74364dfc8f6fc9c5f562c549")
end

get("/image_loc") do
  zip = request.params["zip"]
  goog = HTTParty.get("https://maps.googleapis.com/maps/api/geocode/json?postal_code=#{zip}&key=AIzaSyC3tZ4MX9DwDFMtTofwdwiGST7OXNdUj4Q")
  lat = request.params["lat"].to_f
  lng = request.params["lng"].to_f
  latlong = HTTParty.get("https://api.instagram.com/v1/media/search?lat=#{lat}&lng=#{lng}&client_id=e13705fe74364dfc8f6fc9c5f562c549")

  erb(:image_loc, locals: {latlong: latlong, lat: lat, lng: lng})
end

post("/tags") do
  query = request.params["tag"]
  tag = HTTParty.get("https://api.instagram.com/v1/tags/#{query}/media/recent?client_id=e13705fe74364dfc8f6fc9c5f562c549")
  saved_tags << query
  binding.pry
  erb(:tags, locals: {saved_tags: saved_tags}, tag: query)
end
