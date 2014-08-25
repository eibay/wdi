require 'json'
require 'sinatra'
require 'sinatra/reloader'
require 'pry'

get("/") do
	binding.pry

	all_patients = JSON.parse(File.read("./patients.txt"))

	erb(:index, { locals: {patients: all_patients} })

end

get("/add_patient") do
	erb(:addpatient)
end


post("/add_patient") do
	all_patients = JSON.parse(File.read("patients.txt"))

	first_name = params[:first]
	last_name = params[:last]
	date_of_admittance = params[:date]
	condition = params[:condition]

	patient = {}
	patient[:first] = first
	patient[:last] = last
	patient[:date] = date
	patient[:condition] = condition

	all_patients << patient


	File.write('patients.txt', all_patients.to_json)
end

get("/search_condition") do
	condition = params[:condition]

	all_patients = JSON.parse(File.read("patients.txt"))

	erb(:searchpatientcondition, {locals: {patients: all_patients, condition:condition}})
end

get("/search_name") do
	name = params[:first]
	all_patients = JSON.parse(File.read("patients.txt"))

	erb(:searchpatientfirstname, {locals: {patients: all_patients, first:first}})
end