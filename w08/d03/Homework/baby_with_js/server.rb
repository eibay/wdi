require "sinatra"
require "sinatra/reloader"
require "pry"
require "JSON"

get ('/') do
  erb(:index)
end

get("/ajaxCall") do 
	baby_names = JSON.parse(File.read("./public/ny-baby-names.json"))
	baby_names
end 