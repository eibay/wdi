require 'sinatra'
require 'sinatra/reloader'
require "json"

file = File.read("./public/ny-baby-names.json")
json_file = JSON.parse(file)
names_array = json_file["data"]


get '/names' do
	file
end

get '/:year' do
	erb(:index)
end

