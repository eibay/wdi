require 'sinatra'
require 'sinatra/reloader'
require 'json'

get ('/') do
	baby_names = JSON.parse(File.read('./public/ny-baby-names.json'))
 	year = [params:year]

 #  date = baby_names["data"][0][8]                                                                                                                
 #  name = baby_names["data"][0][9]                                                                                                                 
	# county = baby_names["data"][0][10]                                                                                                              
	# gender = baby_names["data"][0][11]                                                                                                               
	# count = baby_names["data"][0][12] 

	years = baby_names["data"].map do |year|
		year[8]
	end

	specific_year = years.uniq.sort

	erb(:index, { locals: { specific_year: specific_year, baby_names: baby_names, year: year } })
end

get '/:year' do
  year = params[:year]
  baby_names = JSON.parse(File.read("./public/ny-baby-names.json"))
  dates = baby_names["data"].find_all do |year|
    year[8] == year
  end

  erb(:year, { locals: { baby_names: baby_names, year: year } })
end