require 'sinatra'
require 'sinatra/reloader'
require 'httparty'
require 'json'

get '/' do
  erb(:index)
end

get "/2011" do
	baby_names= JSON.parse(File.read('./public/ny-baby-names.json'))
	erb(:babynames2011, {locals: {baby_names: baby_names }})
end

get "/2012" do
	baby_names= JSON.parse(File.read('./public/ny-baby-names.json'))
	erb(:babynames2012, {locals: {baby_names: baby_names }})
end



