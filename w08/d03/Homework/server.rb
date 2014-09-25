require 'sinatra'
require 'sinatra/reloader'
require 'pry'
require 'httparty'
require 'active_record'
require 'json'

get("/") do
	names = JSON.parse(File.read('./public/ny-baby-names.json'))
	year = params[:year]
	binding.pry
	
	year = names["data"].map do |y|
		y[8]
	end

	unique_years = year.uniq.sort

	erb(:index, { locals: { unique_years: unique_years, names: names, year: year } })
end


