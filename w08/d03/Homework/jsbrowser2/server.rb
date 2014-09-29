require "pry"
require 'sinatra'
require 'sinatra/reloader'
require "json"

file = File.read("./public/ny-baby-names.json")
json_file = JSON.parse(file)
names_array = json_file["data"]


get '/data/:year' do
	output = names_array.select{ |item| item[8] == params["year"]}
	json_output = JSON.generate(output)
	json_output
end

get '/:year' do
	erb(:index)
end

