require 'sinatra'
require 'sinatra/reloader'
require 'json'
require 'pry'
require 'httparty'
require './find_by.rb'

get("/") do
	all_patients = JSON.parse(File.read("patients.txt"))
	erb(:index, {locals: { patients: all_patients } })
end

get("/search-name") do
	erb(:search_name) 
end

get("/search-condition") do
	erb(:search_cond) 
end

get('/search-name-results') do
	name = params[:name]
	patients = find_by("first", name)
	header = "Patients named #{name}"

	erb(:search_results, { locals: { header: header, patients: patients } }) 
end

get('/search-condition-results') do
	condition = params[:condition]
	patient = find_by("condition", condition)
	header = "Patients with #{condition}"
	erb(:search_results, { locals: { header: header, patient: patient } }) 
end

get("/add-patient") do
	erb(:add_patient)
end

post("/add-patient") do
	all_patients = JSON.parse(File.read("patients.txt"))
	all_doctors = JSON.parse(File.read("doctors.txt"))

	first = params[:first]
	last = params[:last]
	date = params[:date]
	condition = params[:condition]
	doctor = all_doctors.sample

	patient = {}
	patient[:first] = first
	patient[:last] = last
	patient[:date] = date
	patient[:condition] = condition
	patient[:doctor] = doctor["character"]

	all_patients << patient 

	File.write("patients.txt", all_patients.to_json)
	redirect("/")
end

get("/auto-add") do
	all_patients = JSON.parse(File.read("patients.txt"))
	all_doctors = JSON.parse(File.read("doctors.txt"))

	rand_person = HTTParty.get("http://api.randomuser.me/")
	conditions = ["Heart Disease", "Cancer", "Stroke", "Bronchitis", "Alzheimers", "Influenza", "Pneumonia", "Diabetes", "Poisoning", "Kidney Disease"]
	first = rand_person['results'][0]['user']['name']['first']
	last = rand_person['results'][0]['user']['name']['last']
	date = Time.now.strftime("%D") 
	condition = conditions.sample
	doctor = all_doctors.sample

	patient = {}
	patient[:first] = first.capitalize
	patient[:last] = last.capitalize
	patient[:date] = date
	patient[:condition] = condition
	patient[:doctor] = doctor["character"]

	all_patients << patient 

	File.write("patients.txt", all_patients.to_json)
	redirect("/")
end