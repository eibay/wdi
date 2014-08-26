require 'json'
require 'sinatra'
require 'sinatra/reloader'
require 'pry'

patients =[]

#index/cover page, shows active patient list
get("/") do
	patients = JSON.parse(File.read('./patient2.txt'))
	erb(:index, { locals: { patients: patients} })
end

#patient information form
post("/patients") do
	patient_first_name = params["patient_first_name"]
	patient_last_name = params["patient_last_name"]
	patient_condition = params["patient_condition"]
	date = params["date"]

	patient_hash = {"patient_first_name" => patient_first_name, "patient_last_name" =>patient_last_name, "date" => date, "patient_condition" => patient_condition}
	patients = JSON.parse(File.read('./patient2.txt'))
  	patients << patient_hash

  	File.write('./patient2.txt', patients.to_json)

  	erb(:index, {locals: { patients: patients } }) #or patient
end

get("/patients") do
	erb(:patient)
end

#search by patient name
get("/search_patient") do
	erb(:search_patient)
end

#search by conditions
get ("/search_condition") do
	erb(:search_condition)
end

#making searches more modular practice

get ("/search_patient_result/:patient_first_name") do
	patients = JSON.parse(File.read('./patient2.txt'))
	
	result = patients.find do |x|
	x["patient_first_name"].downcase == params["patient_first_name"].downcase
end
erb(:search_patient_result, { locals: {result: result }} )
end


get ("/search_patient_result/:patient_last_name") do
	patients = JSON.parse(File.read('./patient2.txt'))
	
	result = patients.find do |x|
	x["patient_last_name"].downcase == params["patient_last_name"].downcase
end
erb(:search_patient_result, { locals: {result: result }} )
end
############################################################################

# #see the patient search result
# get ("/search_patient_result") do
# 	patient_first_name = params["patient_first_name"]
# 	patients = JSON.parse(File.read('./patient2.txt'))
# 	erb(:search_patient_result, {locals: { patients: patients, patient_first_name: patient_first_name}})
# end

# #see the condition search result
# get ("/search_condition_result") do

# 	patient_condition = params["patient_condition"]
# 	patients = JSON.parse(File.read('./patient2.txt'))
# 	erb(:search_condition_result, {locals: { patients: patients, patient_condition: patient_condition}})
# end
