require 'sinatra'
require 'pry'
require_relative './model'
require_relative './character_class'
require_relative './house_class'


get('/') do
	erb( :index, {locals: {character: Character.all(), house: House.all() }})
end 

get('/character_new') do
	House.all().each do |a|
		puts " #{a["id"]} #{a["name"]} "
	end 


	erb(:character_new)
end 