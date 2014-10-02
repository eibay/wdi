require 'sinatra'
require 'sinatra/reloader'
require 'json'
require 'pry'

get '/' do
	file = File.read("./public/ny-baby-names.json")
  	file = JSON.parse(file)  

  	baby_info = file["data"]
  	babies=[]
  	baby_info.each do |baby|
  		baby={
  			name: baby[9],
  			county: baby[10],
  			gender: baby[11],
  			year: baby[8],
  			count: baby[12]
  		}

  	babies<<baby
  	# binding.pry
  end
  	# name = file["data"][0][9]
  	# county = file["data"][0][10]
  	# gender = file["data"][0][11]
  	# year = file["data"][0][8]
  	# count = file["data"][0][12]
  erb(:index, { locals: { babies: babies} })
end