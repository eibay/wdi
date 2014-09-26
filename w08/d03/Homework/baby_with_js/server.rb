require 'json'
require 'sinatra'
require 'sinatra/reloader'
require 'pry'


get('/') do

	all_names = JSON.parse(File.read('./public/ny-baby-names.json'))

	year = params[:year]

	# name = all_names["data"][0][9]
	# county = all_names["data"][0][10]
	# gender = all_names["data"][0][11]
	# count = all_names["data"][0][12]
	# year = all_names["data"][0][8]

	years = all_names["data"].map do |y|
		y[8]
	end
	unique_years = years.uniq.sort

	erb(:index, { locals: { unique_years: unique_years, all_names: all_names, year: year } })
end

