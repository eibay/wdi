require 'sinatra'
require 'sinatra/reloader'
require 'pry'
require 'json'


get("/") do
	babys = JSON.parse(File.read('./public/ny-baby-names.json'))
	babys = babys["data"]

	erb(:index, { locals: { babys: babys} })
end