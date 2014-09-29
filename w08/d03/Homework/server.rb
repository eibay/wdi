require 'sinatra'
require 'sinatra/reloader'
require 'JSON'

babiesParsed = JSON.parse(File.read('./public/ny-baby-names.json'))
get ("/" ) do 
	  redirect to('/2007')
end

get '/:id' do
	babies = []
	babiesParsed["data"].each do |baby|
		if baby[8] == params["id"]
			babies<<baby
		end
	end
  erb(:index, locals: {babies: babies})
end