require 'sinatra'
require 'pry'
require 'httparty'



get("/") do
  erb(:index)
end

get("/search") do
  #binding.pry
  search = request.params["search_results"]
  api_call = HTTParty.get("https://api.instagram.com/v1/tags/#{search}/media/recent?client_id=4c08eb6f8fb948d581437e9315b48fb2")

  image_list = []
  api_call["data"].each do |i|
    images = i["images"]["standard_resolution"]["url"]
    image_list.push(images)

end

erb(:search_page, {locals: { tags: search, images_insta: image_list } })

end # ends /search call

get("/lat_long") do
  search = "Here is your lat and long man..."
  lat_search = request.params["lat_results"]
  long_search = request.params["long_results"]
  second_api_call = HTTParty.get("https://api.instagram.com/v1/media/search?lat=#{lat_search}&lng=#{long_search}&client_id=4c08eb6f8fb948d581437e9315b48fb2")

  image_list = []
  second_api_call["data"].each do |i|
    images = i["images"]["standard_resolution"]["url"]
    image_list.push(images)
  end

  erb(:search_page, {locals: { tags: search, images_insta: image_list } })

end




















