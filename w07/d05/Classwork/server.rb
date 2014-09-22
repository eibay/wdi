require 'sinatra'
require 'sinatra/reloader'
require 'json'
require 'httparty'
require 'uri'
require 'pry'

get ("/") do 
	erb(:index)
end
