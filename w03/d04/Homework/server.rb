require 'sinatra'
require 'pry'

info_array =[]

get ("/students/new") do
	erb(:index)
end

post ("/") do
info_hash= {}
	name = params["name"]
	age = params["age"]
	spell = params["favorite_spell"]

	info_hash[:name] = name	
	info_hash[:age] = age
	info_hash[:favorite_spell]= spell

	info_array.push(info_hash)

	erb(:registrar, {locals: { info_array: info_array }})
	
end

get ("/students/show/:name") do
	erb(:shows, {locals: { info_array: info_array }})
end

get ("/")do
	search_result = params["search"]
	erb(:search, {locals: { info_array: info_array }})
end

get ("/search")do
	search_result = params["search"]
	erb(:search_result, {locals: { info_array: info_array }})
end
