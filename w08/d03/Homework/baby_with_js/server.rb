require 'sinatra'
require 'sinatra/reloader'
require 'json'

get '/' do
  erb(:index)
end

get '/:year' do
  year = params[:year]
  names = JSON.parse(File.read('./public/ny-baby-names.json'))
  erb(:year, locals: {names: names, year: year})
end
