require 'sinatra'
require 'sinatra/reloader'
require 'json'
require 'pry'

get ('/') do
	erb(:index)
end

get('/babies') do
	babynames = File.read('./public/ny-baby-names.json')
end