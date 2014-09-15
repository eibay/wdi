require 'pry'
require 'sinatra'
require 'sinatra/reloader'
require_relative './lib/connection'
require_relative './lib/dogbreed'


after do
	ActiveRecord::Base.connection.close
end

get("/") do
  erb(:index, { locals: { dogbreeds: Dogbreed.all() } })
# binding.pry
end

delete ("/dog/:id") do
	dogbreed = Dogbreed.find_by({id: params[:id]})
	dogbreed.destroy
	redirect "/"
end

get("/dogbreeds/new") do 
	erb(:index, { locals: { dogbreeds: Dogbreed.all() } })
end

get("/dogbreeds/edit/:id") do
	dogbreed = Dogbreed.find_by({id: params[:id]})
	erb(:"views/edit", { locals: { dogbreed: dogbreed } })
end

post("/dogbreeds") do
  dogbreed_hash = { 
    name: params["name"]
  }

  Dogbreed.create(dogbreed_hash)

  erb(:new, { locals: { dogbreeds: Dogbreed.all() } })
end