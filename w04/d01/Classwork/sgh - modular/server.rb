require 'json'
require 'sinatra'
require 'sinatra/reloader'
require 'pry'
require 'httparty'

def patients()
  return JSON.parse(File.read('./patients.txt'))
end













character_str = File.read("./greys.txt")

dr_array = []
character_str.split("\n").each do |x|
  character = x.split(',')[1]
  if character.split(' ')[0] == "Dr."
    dr_array << character
  end
end


get("/") do 
	patients = JSON.parse(File.read('./patients.txt'))
	erb(:main, {locals: { patients: patients }})
end

post("/add") do 

	first_name = params["first_name"].capitalize
	last_name = params["last_name"].capitalize
	date = params["date"]
	condition = params["condition"].capitalize
  doctor = dr_array.sample

	patients = patients()
	hash = {}
	hash["first_name"] = first_name
	hash["last_name"] = last_name
	hash["date"] = date
	hash["condition"] = condition
  hash["doctor"] = doctor

	patients << hash

	File.write('./patients.txt', patients.to_json)
	patients = patients()

	erb(:main, {locals: { patients: patients }})
end

get("/add") do
	erb(:add)
end

get("/search") do 
  data_type = params["data_type"]
  data = params["data"].capitalize

  patients = patients()

  patient_search = []

  if data_type == "condition"
  	patients.each do |x|
  		if x["condition"] == data
  			patient_search << x
  		end	
  	end
  elsif data_type == "first_name"
  	patients.each do |y|
  		if y["first_name"] == data
  			patient_search << y
  		end	
  	end
  end

  erb(:search_page, {locals: { patient_search: patient_search, data: data}})
end


# def find_by(key, value)
#   if data_type == key
#     patients.each do |x|
#       if x["condition"] == value
#         patient_search << x
#       end
#     end
#   elsif data_type == key
#     patients.each do |y|
#       if y["first_name"] == value
#         patient_search << y
#       end 
#     end
#   end
# end














