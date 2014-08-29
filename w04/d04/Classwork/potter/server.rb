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
  #only create once
  # gryfindor = JSON.parse(File.read("./houses.txt"))[0]
  # slytherin = JSON.parse(File.read("./houses.txt"))[1]
  #did create
  houses = JSON.parse(File.read("./houses.txt"))
  gryfindor = House.new(houses[0])
  slytherin = House.new(houses[1])
  
  # houses << gryfindor
  # houses << slytherin
  erb(:houses, {locals: {gryfindor: gryfindor,slytherin: slytherin}})
end

get "/house/:id" do
  houses = JSON.parse(File.read("./houses.txt"))
  gryfindor = House.new(houses[0])
  slytherin = House.new(houses[1])
  if params["id"] == "96c298446bde846f11c5fc64ca24c81e"
  people = gryfindor.character
  elsif params["id"] == "cde36e3316236d4d78c85f08bfd4808b"
    people = slytherin.character
  end
    
    # if params["id"]=="96c298446bde846f11c5fc64ca24c81e"
    #   people = Character.select_by("house_id", "96c298446bde846f11c5fc64ca24c81e")
    # elsif params["id"]=="cde36e3316236d4d78c85f08bfd4808b"
    #   people = Character.select_by("house_id", "cde36e3316236d4d78c85f08bfd4808b")
    # end
erb(:house, {locals: {people: people}})
end

get "/new/character" do
  erb(:newcharacter, {locals:{houses: House.all()}})
end

post "/characters" do 
  name = params["name"]
  url = params["url"]
  house = params["house"]
  characters = JSON.parse(File.read('./characters.txt'))
  newcharacter = {"name"=>name, "url"=>url, "house_id"=>house, "id"=>SecureRandom.hex}
  characters << newcharacter
  File.write('./characters.txt', characters.to_json)
  @character = Character.new(newcharacter)
  erb(:characters, {locals: {characters: Character.all()}})
end

get "/characters" do
  erb(:characters, {locals: {characters: Character.all()}})
end

get "/character/:id" do
  person = params["id"]
  person1 = Character.find_by("id", person)
  house = person1.house
  erb(:character, {locals: {house: house, person1: person1}})
end




















