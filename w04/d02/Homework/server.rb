require 'sinatra'
require 'sinatra/reloader'
require 'pry'
require_relative './lib/astronaut'
require_relative './lib/shuttle'

get "/" do
  erb(:index)  
end

get "/astronauts" do
  erb(:astronauts,{locals: {astronauts: Astronauts.list()}})
end

get "/shuttles" do
  erb(:shuttles, {locals: {shuttles: Shuttles.list()}}) 
end

get "/add/astronaut"  do
  erb(:addastronaut, {locals: {shuttles: Shuttles.list()}}) 
end

get "/add/shuttle" do
  erb(:addshuttle)
end

post "/shuttles" do
  shuttle = {"name"=> params["name"], "origin"=> params["origin"], "destination"=> params["destination"]}
Shuttles.add(shuttle)

erb(:shuttles, {locals: {shuttles: Shuttles.list()}}) 
end

post "/astronauts" do
  astronaut = {"name" => params["name"],"rank"=>params["rank"], "shuttleid"=> params["shuttleid"]}
  Astronauts.add(astronaut)
  erb(:astronauts,{locals: {astronauts: Astronauts.list()}})
end

get "/astronaut/:id" do
  astronaut = Astronauts.find_by("id", params["id"])
  shuttle = Shuttles.find_by("id", astronaut["shuttleid"])
  erb(:astronaut, {locals: {astronaut: astronaut, shuttle: shuttle}})
end

get "/shuttle/:id" do
  shuttle = Shuttles.find_by("id", params["id"])
  astronaut_in_shuttle = Astronauts.select_by("shuttleid", shuttle["id"])
  erb(:shuttle, {locals: {astronaut: astronaut_in_shuttle, shuttle: shuttle}})
end











