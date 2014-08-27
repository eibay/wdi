require 'pry'
require 'sinatra'
require 'sinatra/reloader'
require 'json'
require 'securerandom'
require_relative './lib/astro'
require_relative './lib/ship'





get ("/") do 
erb(:index)
end

post ("/astros") do 
	astro_id = SecureRandom.hex
binding.pry
	astro = {"name" => params["name"], "rank" => params["rank"], "ship_id" => params["ship_id"], "astro_id" => astro_id}
	binding.pry
	Astro.create(astro)
erb(:astros, locals: { astros: Astro.all() })
end

post ("/ships") do 
	ship_id = SecureRandom.hex
	ship = { "name" => params["name"], "origin" => params["origin"], "destination" => params["destination"], "ship_id" => ship_id }
	Ship.create(ship)
erb(:ships, locals: {ships: Ship.all() })
end

get("/astros") do 
erb(:astros, locals: { astros: Astro.all() })
end

get("/astros/new") do 
erb(:new_astro, locals: { ships: Ship.all() })
end


get("/ships/new") do 
erb(:new_ship)
end

get("/ships") do
	erb(:ships, locals: { ships: Ship.all() })
end

get("/astros/:id") do 
	astro = Astro.find_by("ship_id", params["ship_id"])
	ship = Ship.find_by("ship_id", astro["astro_id"])
erb(:astro, locals: { astro: astro, ship: ship})
end


get("/ships/:id") do 
	ship = Ship.find_by("ship_id", params["astro_id"])
	astros_in_ship = Astro.select_by("ship_id", ship["ship_id"])
erb(:ship, locals: { ship: ship, astros: astros_in_ship})
end