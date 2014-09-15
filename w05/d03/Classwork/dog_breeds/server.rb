require 'sinatra'
require 'sinatra/reloader'
require_relative './lib/connection'
require_relative './lib/dog'
#require_relative './seed'

after do
	ActiveRecord::Base.connection.close
end

get("/") do
  erb(:index)
end

get("/dogs") do
  erb(:"dogs/index", { locals: { dogs: Dog.all(), } })
end

get("/dogs/new") do
  erb(:"dogs/new", { locals: { dogs: Dog.all(), } })
end



