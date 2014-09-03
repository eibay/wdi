require_relative './lib/connection'
require_relative './lib/greeter'
require 'sinatra'
require 'sinatra/reloader'
require 'pry'

get "/" do 
	erb(:main)
end

get "/search" do 
	search = params["greeter"]
	greeters = Greeter.where(name: search)
	erb(:search, {locals: { greeters: greeters, search: search}})
end

