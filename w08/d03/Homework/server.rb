require 'sinatra'
require 'sinatra/reloader'
require 'json'
require 'pry'

data = JSON.parse(File.read('./public/ny-baby-names.json'))
babyNames = data['data']

byYear = {
	"baby2007" =>[],
	"baby2008" =>[],
	"baby2009" =>[],
	"baby2010" =>[],
	"baby2011" =>[],
	"baby2012" =>[]
}

babyNames.each do |baby|
	
	if baby[8] == '2007'
		byYear['baby2007'].push(baby)
	elsif baby[8] == '2008'
		byYear['baby2008'].push(baby)
	elsif baby[8] == '2009'
		byYear['baby2009'].push(baby)
	elsif baby[8] == '2010'
		byYear['baby2010'].push(baby)
	elsif baby[8] == '2011'
		byYear['baby2011'].push(baby)
	else
		byYear['baby2012'].push(baby)
	end

end



get '/:year' do

	year = params['year']
	babies =byYear.select{|k,v| k == "baby#{year}"}["baby#{year}"]
	  
erb(:index, {locals: {babies: babies}})

end








