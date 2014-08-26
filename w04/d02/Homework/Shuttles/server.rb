require 'sinatra'
require 'sinatra/reloader'
require 'pry'
require_relative './lib/astro'
require_relative './lib/shuttle'

get("/") do
	erb(:index)
end

# from new_astro form
post("/astros") do
	astro = { name: params["name"], rank: params["rank"], shuttle_id: params["shuttle_id"]}
	Astro.create(astro)

	erb(:astros, { locals: { astros: Astro.all() } })	
end

get("/astros") do
	erb(:astros, { locals: { astros: Astro.all() } })	
end
# from new astro link
get("/astros/new") do
	erb(:new_astro, { locals: { shuttles: Shuttle.all() } })
end

get("/astros/:a_id") do
	astro = Astro.find_by("a_id", params[:a_id])
	shuttle = Shuttle.find_by("s_id", astro["shuttle_id"])

	erb(:astro, { locals: { astro: astro, shuttle: shuttle } })
end

get("/shuttles/new") do
	erb(:new_shuttle)
end

get("/shuttles/:s_id") do
	shuttle = Shuttle.find_by("s_id", params[:s_id])
	astros_on_shuttle = Astro.select_by("shuttle_id", shuttle["s_id"])

	erb(:shuttle, { locals: { shuttle: shuttle, astros: astros_on_shuttle } })
end

post("/shuttles") do
	shuttle = { name: params["name"], country: params["country"], destination: params["destination"]}
	Shuttle.create(shuttle)

	erb(:shuttles, { locals: { shuttles: Shuttle.all } })
end

get("/shuttles") do
	erb(:shuttles, { locals: { shuttles: Shuttle.all } })
end