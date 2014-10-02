require 'sinatra'
require 'sinatra/reloader'
require 'pry'
require 'json'
require_relative './lib/connection'
require_relative './lib/grocery'


get("/") do

	file = "hello world"

	# binding.pry

	erb(:index, { locals: { file: file} })
end







