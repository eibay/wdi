require 'sinatra'
require 'sinatra/reloader'
require 'json'
require 'pry'
baby_names=JSON.parse(File.read('./public/ny-baby-names.json'));

get '/' do

	erb(:index)
end

get('/:year') do
	
	erb(:year)

end
