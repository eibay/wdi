require 'sinatra'
require 'sinatra/reloader'
require 'json'
require 'pry'
baby_names=JSON.parse(File.read('./public/ny-baby-names.json'));

get '/' do
	erb(:index)
end

get('/:year') do
	baby_year=[]
	baby_names["data"].each do |baby|
		if baby[8]==params[:year]
			baby_year.push(baby)
		end
	end
	erb(:year, {locals:{baby_year:baby_year}})

end
