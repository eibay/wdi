require 'sinatra'
require 'sinatra/reloader'
require 'httparty'
require 'json'

get "/" do

  erb(:index)
end
