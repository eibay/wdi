require 'sinatra'
require 'sinatra/reloader'
require 'pry'
require 'Httparty'

get ("/") do
  erb(:index) 
end