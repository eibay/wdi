require 'sinatra'
require 'sinatra/reloader'
require 'json'
require 'pry'

baby_names_parsed = JSON.parse(File.read('./public/ny-baby-names.json'))
baby_names = baby_names_parsed["data"]

get '/' do
  erb(:index)
end

get '/year' do
	year = params['year']
	babies = []
	baby_names.each do |baby|
		if baby[8] == year
			new_hash = {
				name: baby[9],
				county: baby[10],
				gender: baby[11],
				count: baby[12]
			}

			babies << new_hash
		end
	end
	babies.to_json
	# erb(:index, {locals: { babies: babies2007}})
end
