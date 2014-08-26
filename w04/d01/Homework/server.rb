require 'sinatra'
require 'sinatra/reloader'
require 'pry'
require_relative './lib/mechanic'

get '/' do

  erb(:index)
end

get '/mechanics' do
  mechanics = Mechanic.all()

  erb(:mechanics, locals: {mechanics: mechanics})
end

get '/mechanics/new' do
  mechanics = Mechanic.all()

  erb(:new_mechanic, locals: {mechanics: mechanics})
end

post '/mechanic/new' do
  first = params["first"]
  last = params["last"]
  age = params["age"].to_i
  fav_car = params["fav_car"]

  new_mechanic = {first: first, last: last, age: age, fav_car: fav_car}
  mechanics = Mechanic.all()
  Mechanic.create(new_mechanic)

  erb(:new_mechanic, locals: {mechanics: mechanics})
end

get '/mechanics/:mechanic' do
  mechanic = params[:mechanic]
  mechanics = Mechanic.all()
specified_mech =  mechanics.find do |m| mechanic == m["last"] end
  
  erb(:mechanic, locals: {mechanic: specified_mech})
end

get '/cars' do

  erb(:cars)
end
