require 'sinatra'
require 'sinatra/reloader'
require "json"

file = File.read("./public/ny-baby-names.json")
json_file = JSON.parse(file)
names_array = json_file["data"]


get '/:year' do
	names = names_array.select { |name| name[8] == params["year"]}
  erb(:index, { locals: {names: names} })
end
