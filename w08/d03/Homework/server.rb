require 'sinatra'
require 'sinatra/reloader'
require 'pry'
require 'httparty'
require 'active_record'
require 'json'

get("/") do
	names = JSON.parse(File.read('./public/ny-baby-names.json'))
	erb(:index, { locals: { year: year, names: names } })
end





