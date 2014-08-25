require 'json'
require 'sinatra'
require 'pry'
require 'httparty'

character_str = File.read("./greys.txt")

array = []
 character_str.split("\n").each do |x|
  hash = {}
  hash[:actor] = x.split(',')[0]
  hash[:character] = x.split(',')[1]
  hash[:episodes] = x.split(',')[2].split(' ')[0].to_i

  year = x.split(',')[3]
  puts hash[:actor]
  if year.length == 4
    hash[:start_year] = year.to_i
    hash[:end_year] = year.to_i
  else
    hash[:start_year] = year.split('-')[0].to_i
    hash[:end_year] = year.split('-')[1].to_i
  end

  array << hash
 end

dr_array = []
array.each do |d|
  if d[:character].split(" ")[0] == "Dr."
    dr_array << d
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
  doctor = dr_array.sample[:character]

	patients = JSON.parse(File.read('./patients.txt'))
	hash = {}
	hash["first_name"] = first_name
	hash["last_name"] = last_name
	hash["date"] = date
	hash["condition"] = condition
  hash["doctor"] = doctor

	patients << hash

	File.write('./patients.txt', patients.to_json)
	patients = JSON.parse(File.read('./patients.txt'))

	erb(:main, {locals: { patients: patients }})
end

get("/add") do
	erb(:add)
end

get("/search") do 
  data_type = params["data_type"]
  data = params["data"].capitalize

  patients = JSON.parse(File.read('./patients.txt'))

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














