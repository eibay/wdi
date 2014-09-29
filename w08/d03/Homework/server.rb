require "sinatra"
require "sinatra/reloader"
require "pry"
require "JSON"

get '/' do
	baby_names = JSON.parse(File.read("./public/ny-baby-names.json"))
	dataIWant = []
	baby_names["data"].each do |a|
		if a[8] == "2012"
			newHash = {
			year: a[8],
			name: a[9],
			county: a[10],
			gender: a[11],
			count: a[12]}
			dataIWant.push(newHash)
		end 
	end 
  erb(:index, {locals: { data: dataIWant }})
end


get("/:year") do 
	baby_names = JSON.parse(File.read("./public/ny-baby-names.json"))
	dataIWant = []
	baby_names["data"].each do |a|
		if a[8] == params["year"]
			newHash = {
			year: a[8],
			name: a[9],
			county: a[10],
			gender: a[11],
			count: a[12]}
			dataIWant.push(newHash)
		end 
	end 
 erb(:index, {locals: { data: dataIWant }})
end 