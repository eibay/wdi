require 'sinatra'
require 'sinatra/reloader'
require 'json'
require 'pry'

baby_names_list= JSON.parse(File.read('./public/ny-baby-names.json'))
baby_names = baby_names_list["data"]

get ("/") do
  erb(:index)
end


get ("/2007") do
	array_2007 = []
	baby_names.each do |baby|
		if baby[8] == "2007"
			hash_2007 = {
				name: baby[9],
				county: baby[10],
				gender: baby[11],
				count: baby[12]
			}
			array_2007 << hash_2007
		end
	end
erb(:index, {locals: {babies: array_2007}})
end



get ("/2008") do
	array_2008 = []
	baby_names.each do |baby|
		if baby[8] == "2008"
			hash_2008 ={
				name: baby[9],
				county: baby[10],
				gender: baby[11],
				count: baby[12]
			}
			array_2008 << hash_2008
		end
	end
erb(:index, {locals: {babies: array_2008}})
end


get ("/2009") do
	array_2009 = []
	baby_names.each do |baby|
		if baby[8] == "2009"
			hash_2009 ={
				name: baby[9],
				county: baby[10],
				gender: baby[11],
				count: baby[12]
			}
			array_2009 << hash_2009
		end
	end
erb(:index, {locals: {babies: array_2009}})
end



get ("/2010") do
	array_2010 = []
	baby_names.each do |baby|
		if baby[8] == "2010"
			hash_2010 ={
				name: baby[9],
				county: baby[10],
				gender: baby[11],
				count: baby[12]
			}
			array_2010 << hash_2010
		end
	end

erb(:index, {locals: {babies: array_2010}})
end



get ("/2011") do
	array_2011 = []
	baby_names.each do |baby|
		if baby[8] == "2011"
			hash_2011 ={
				name: baby[9],
				county: baby[10],
				gender: baby[11],
				count: baby[12]
			}
			array_2011 << hash_2011
		end
	end
erb(:index, {locals: {babies: array_2011}})
end


get ("/2012") do
	array_2012 = []
	baby_names.each do |baby|
		if baby[8] == "2012"
			hash_2012 ={
				name: baby[9],
				county: baby[10],
				gender: baby[11],
				count: baby[12]
			}
			array_2012 << hash_2012
		end
	end
erb(:index, {locals: {babies: array_2012}})
end
