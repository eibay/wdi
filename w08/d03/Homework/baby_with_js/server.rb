require 'sinatra'
require 'sinatra/reloader'
require 'json'
require 'pry'

get '/' do
	erb(:index)
end
get('/popularity') do
	erb(:popularity)
end
get('/:year') do
	erb(:year)
end
get('/comparenames') do
	erb(:comparenames)
end


