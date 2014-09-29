require 'sinatra'
require 'sinatra/reloader'
require 'json'
require 'pry'

babynames = JSON.parse(File.read('./public/ny-baby-names.json'))

get ('/:year') do
	babies = []
	
	babynames["data"].each do |record|
		if record[8] == params[:year]
			babies.push(record)	
		end
	end
	erb(:index, {locals: {babies: babies}})
end