require 'sinatra'
require 'sinatra/reloader'
require 'json'
require 'pry'

get '/' do
  	erb(:index)
end

get '/2011' do
	file = File.read('./public/ny-baby-names.json')
	file = JSON.parse(file)

	baby_info = file["data"]
	babies = []
	list = []

	baby_info.each do |baby|
		baby = {year: baby[8], name: baby[9], county: baby[10], gender: baby[11], count: baby[12]}
		babies << baby
	end

	babies.each do |baby|
		if baby[:year] == "2011"
			list << baby
		end
	end
	
	erb(:eleven, locals: { babies: list })
end

get '/2012' do
	file = File.read('./public/ny-baby-names.json')
	file = JSON.parse(file)

	baby_info = file["data"]
	babies = []
	list = []

	baby_info.each do |baby|
		baby = {year: baby[8], name: baby[9], county: baby[10], gender: baby[11], count: baby[12]}
		babies << baby
	end

	babies.each do |baby|
		if baby[:year] == "2012"
			list << baby
		end
	end
	
	erb(:twelve, locals: { babies: list })
end

#########################################

# require 'sinatra'
# require 'sinatra/reloader'
# require 'json'
# require 'pry'

# get '/' do
#   	erb(:index)
# end

# get '/2011' do
	
# 	babySearch("2011");
# 	binding.pry
	
# 	erb(:eleven, locals: { babies: @list })
# end

# get '/2012' do
	
# 	babySearch("2012");
	
# 	erb(:twelve, locals: { babies: @list })
# end

# def babySearch(born_year)
# 	file = File.read('./public/ny-baby-names.json')
# 	file = JSON.parse(file)

# 	baby_info = file["data"]
# 	@babies = []
# 	@list = []

# 	baby_info.each do |baby|
# 		baby = {year: baby[8], name: baby[9], county: baby[10], gender: baby[11], count: baby[12]}
# 		@babies << baby
# 	end

# 	@babies.each do |baby|
# 		if baby[:year] == born_year
# 			@list << baby
# 		end
# 		return @list
# 	end
# end






