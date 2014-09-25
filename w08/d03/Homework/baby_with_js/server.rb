require 'sinatra'
require 'sinatra/reloader'
require 'json'
require 'pry'

baby_names_parsed = JSON.parse(File.read('./public/ny-baby-names.json'))
baby_names = baby_names_parsed["data"]

get '/' do
  erb(:index)
end

get '/2007' do
	
	babies2007 = []
	baby_names.each do |baby|
		if baby[8] == "2007"
			hash2007 = {
				name: baby[9],
				county: baby[10],
				gender: baby[11],
				count: baby[12]
			}

			babies2007 << hash2007
		end
	end
	babies2007.to_json
	# babies2007
	# erb(:index, {locals: { babies: babies2007}})
end

get '/2008' do 
	content_type :json
	babies2008 = []
	baby_names.each do |baby|
		if baby[8] == "2008"
			hash2008 = {
				name: baby[9],
				county: baby[10],
				gender: baby[11],
				count: baby[12]
			}

			babies2008 << hash2008
		end
	end
	babies2008.to_json
	# erb(:index, {locals: { babies: babies2008}})
end

get '/2009' do 
	content_type :json
	babies2009 = []
	baby_names.each do |baby|
		if baby[8] == "2009"
			hash2009 = {
				name: baby[9],
				county: baby[10],
				gender: baby[11],
				count: baby[12]
			}

			babies2009 << hash2009
		end
	end
	babies2009.to_json
	# erb(:index, {locals: { babies: babies2009}})
end

get '/2010' do 
	content_type :json
	babies2010 = []
	baby_names.each do |baby|
		if baby[8] == "2010"
			hash2010 = {
				name: baby[9],
				county: baby[10],
				gender: baby[11],
				count: baby[12]
			}

			babies2010 << hash2010
		end
	end
	babies2010.to_json
	# erb(:index, {locals: { babies: babies2010}})
end

get '/2011' do 
	content_type :json
	babies2011 = []
	baby_names.each do |baby|
		if baby[8] == "2011"
			hash2011 = {
				name: baby[9],
				county: baby[10],
				gender: baby[11],
				count: baby[12]
			}

			babies2011 << hash2011
		end
	end
	babies2011.to_json
	# erb(:index, {locals: { babies: babies2011}})
end

get '/2012' do 
	content_type :json
	babies2012 = []
	baby_names.each do |baby|
		if baby[8] == "2012"
			hash2012 = {
				name: baby[9],
				county: baby[10],
				gender: baby[11],
				count: baby[12]
			}

			babies2012 << hash2012
		end
	end
	babies2012.to_json
	# erb(:index, {locals: { babies: babies2012}})
end



