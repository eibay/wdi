require_relative './character'
require_relative './house'
require_relative './model'
require 'sinatra'
require 'sinatra/reloader'
require 'pry'

get "/" do
  erb(:index)
end

get "/characters" do
  characters = Character.all()
  # houses = House.all()
  house_id = characters.each do |character| character["house_id"] end
  # house = characters.each do |character| character.house() end
  erb(:characters, locals: {characters: characters})
end

# get "/characters/:id" do
#
# end

get "/characters/new" do
  houses = House.all()
  erb(:new_character, locals: {houses: houses})
end

post "/characters" do
  character_create = Character.create(params)
  characters = Character.all()
  erb(:characters, locals: {characters: characters})
end

get "/houses" do

  erb(:houses)
end

get "/houses/:id" do

end
