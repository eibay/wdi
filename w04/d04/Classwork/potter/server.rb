require 'sinatra'
require 'sinatra/reloader'
require 'pry'
require 'json'
require 'securerandom'
require_relative './house.rb'
require_relative './character.rb'

get "/" do
  erb(:index)
end

get "/houses" do
  # gryfindor1 = ({"name"=> "gryfindor", "age"=>"old", "id"=>"96c298446bde846f11c5fc64ca24c81e"})
  # slytherin1 = ({"name"=>"slytherin", "age"=>"very old", "id"=>"cde36e3316236d4d78c85f08bfd4808b"})
  # houses << House.new(gryfindor1)
  # houses << House.new(slytherin1)
  # File.write("./houses.txt", houses.to_json)
  #how to make instances in the txt file
  #dont need to House.all() changes to instances
  erb(:houses, {locals: {houses: House.all()}})
end

get "/house/:id" do
  house = House.find_by("id", params["id"])
  people = house.character
  #attribute is house
  erb(:house, {locals: {people: people, house: house}})
end

get "/new/character" do
  erb(:newcharacter, {locals:{houses: House.all()}})
end

post "/characters" do 
  name = params["name"]
  url = params["url"]
  house = params["house"]
  newcharacter = ({"name"=>name, "url"=>url, "house_id"=>house, "id"=>SecureRandom.hex})
  characters = Character.create(newcharacter)
  #in the method of Character.all() turns it into an instance
  erb(:characters, {locals: {characters: Character.all()}})
end

get "/characters" do
  erb(:characters, {locals: {characters: Character.all()}})
end

get "/character/:id" do
  person1 = Character.find_by("id", params["id"])
  house = person1.house
  #the attribute is person1
  erb(:character, {locals: {house: house, person1: person1}})
end





















