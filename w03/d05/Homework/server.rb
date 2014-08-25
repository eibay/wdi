require 'json'
require 'sinatra'
require 'sinatra/reloader'
require 'pry'

get("/") do 
	patients = JSON.parse(File.read('./patientinfo.txt'))
	erb(:index,{ locals: { patients: patients } })
end
post("/patients") do
	first_name = params["first"]
	last_name = params["last"]
	condition = params["condition"]
	date_of_admittance = params["date"]

	patient = {"first" => first_name, "last" => last_name, "date" => date_of_admittance, "condition" => condition}
	patients = JSON.parse(File.read('./patientinfo.txt'))
	patients.push(patient)
	patients_json = JSON.generate(patients)
	File.write('./patientinfo.txt', patients_json)
	erb(:index, {locals: {patients: patients }})
end

get("/patients") do
	erb(:patients)
end

get("/condition") do
	erb(:condition)
end

get ("/condition") do
	erb(:conditionpost, {locals: { patients: patients } } )

	binding.pry
end



