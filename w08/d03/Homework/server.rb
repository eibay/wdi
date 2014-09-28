require 'sinatra'
require 'sinatra/reloader'
require 'pry'
require 'json'

get('/') do
	names = JSON.parse(File.read('./public/ny-baby-names.json'))
	year = params[:year]
	
	years = names["data"].map do |y|
		y[8]
	end

	unique_years = years.uniq.sort

	erb(:index, { locals: { unique_years: unique_years, names: names, year: year } })
end


