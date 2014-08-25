require 'pry'
require 'json'
require 'sinatra'
require 'sinatra/reloader'
require 'HTTParty'
require './doc.rb'

admitted = " "

get("/") do
	admitted = " "
	patients = " "
	patients = JSON.parse(File.read('./patients.txt'))
	patients.each do |x|
		admitted += "<li>On #{x["date"]} #{x["fName"]} #{x["lName"]} was admitted with #{x["condition"]} and assigned to #{x["doc"]}.</li>"	
	end
erb(:index, locals: {admitted: admitted})
end

get("/admit") do
	patients = " "
erb(:admit)
end

post("/") do
	patients = " "
	admitted = " "
	patients = JSON.parse(File.read('./patients.txt'))
	fName = params["fName"]
	lName = params["lName"]
	date = params["date"]
	condition = params["condition"]
	doc = doc_search
	patients<<{fName: fName, lName: lName, date: date, condition: condition, doc: doc}

	File.write('./patients.txt', patients.to_json)
	patients = JSON.parse(File.read('./patients.txt'))
	patients.each do |x|
		admitted += "<li>On #{x["date"]} #{x["fName"]} #{x["lName"]} was admitted with #{x["condition"]} and assigned to #{x["doc"]}.</li>"	
	end
erb(:index, locals: {admitted: admitted})
end
get ("/search") do
erb(:search)
end
get ("/results") do
	patients = " "
	results = " "
		patients = JSON.parse(File.read('./patients.txt'))
		patients.each do |x|
			if x[params["type"]].include?(params["search"])
				results += "<li>#{x["doc"]}'s patient #{x["fName"]} #{x["lName"]}, who was admitted on #{x["date"]}, has #{x["condition"]} and matches your search</li>"
			end
		end
			if results == " "
				results = "Looks like your search came up empty."
			end
		
	erb(:results, locals: {results: results})
end

get ("/random") do
	response = HTTParty.get("http://api.randomuser.me/")
	
	fName = response["results"][0]["user"]["name"]["first"].capitalize
	lName = response["results"][0]["user"]["name"]["last"].capitalize 
	year = rand(13) + 2000
	month = rand(11) + 1
	day = rand(29) + 1
	date = "#{year}/#{month}/#{day}"
	cond = rand(4)
		if cond == 0
			condition = "a sore throat"
		elsif cond == 1
			condition = "a broken arm"
		elsif cond == 2
			condition = "swine flu"
		elsif cond == 3 
			condition = "some foot fungus"
		else condition = "scurvy"
		end
	doc = doc_search
	
	patients = JSON.parse(File.read('./patients.txt'))
	patients<<{fName: fName, lName: lName, date: date, condition: condition, doc: doc}
	File.write('./patients.txt', patients.to_json)
	admitted = " "
	patients = JSON.parse(File.read('./patients.txt'))
	patients.each do |x|
		admitted += "<li>On #{x["date"]} #{x["fName"]} #{x["lName"]} was admitted with #{x["condition"]} and assigned to #{x["doc"]}.</li>"	
	end
erb(:index, locals: {admitted: admitted})
end




