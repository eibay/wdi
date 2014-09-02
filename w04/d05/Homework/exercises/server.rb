require 'sinatra'
require 'sinatra/reloader'
require_relative './lib/greeter'
require 'pry'


get("/") do

erb(:index)

end

post("/search") do
	greeters = Greeter.all()
	name = params["name"]

	erb(:search_results, { locals: { greeters: Greeter.all(), name: name } })

end