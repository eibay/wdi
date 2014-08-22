require 'sinatra'
require 'sinatra/reloader'
require 'json'
require 'pry'

get("/") do
	all_patients = JSON.parse(File.read("patients.txt"))
	erb(:index, {locals: { patients: all_patients } })
end

get("/search-name") do
	name = params[:name]
	all_patients = JSON.parse(File.read("patients.txt"))

	erb(:search_name, {locals: { patients: all_patients, name: name} })
end

get("/search-condition") do
	condition = params[:condition]

	all_patients = JSON.parse(File.read("patients.txt"))

	erb(:search_cond, {locals: { patients: all_patients, condition: condition } })
end

get('/search-name-results') do
	all_patients = JSON.parse(File.read("patients.txt"))

	name = params[:name]
	condition = nil

	header = "Patients named #{name}"

	erb(:search_results, { locals: { patients: all_patients, header: header, name: name, condition: condition } }) 
end

get('/search-condition-results') do
	all_patients = JSON.parse(File.read("patients.txt"))

	name = nil
	condition = params[:condition]

	header = "Patients with #{condition}"
	erb(:search_results, { locals: { patients: all_patients, header: header, name: name, condition: condition } }) 
end

get("/add-patient") do
	erb(:add_patient)
end

post("/add-patient") do
	all_patients = JSON.parse(File.read("patients.txt"))

	first = params[:first]
	last = params[:last]
	date = params[:date]
	condition = params[:condition]

	patient = {}
	patient[:first] = first
	patient[:last] = last
	patient[:date] = date
	patient[:condition] = condition

	all_patients << patient 

	File.write("patients.txt", all_patients.to_json)
	redirect("/")
end

