require 'sinatra'
require 'json'
require 'pry'
require 'sinatra/reloader'

get("/") do
	patients = JSON.parse(File.read('./patients.txt'))
	erb(:list, { locals: { patients: patients } })
end

post("/")  do
	# gather new patient information from form
	first = params["first"]
	last = params["last"]
	admit_date = params["admit_date"]
	condition = params["condition"]

	# make hash of new patient information
	patient = { "first" => first, "last" => last, "admit_date" => admit_date, "condition" => condition}

	# get all patients text
	patients = JSON.parse(File.read('./patients.txt'))

	# add new patient to all patients
	patients << patient

	# save all patients text
	patients_json = JSON.generate(patients)
	File.write('./patients.txt', patients_json)
# binding.pry
	# display list page with all patients information
	erb(:list, { locals: { patients: patients } })
end

get("/new_patient") do
	erb(:new_patient)
end

get("/search_condition") do
	condition_searched = params["condition_search"]

	patients = JSON.parse(File.read('./patients.txt'))

	erb(:search_condition, { locals: { patients: patients, condition_searched: condition_searched } })
end

get("/search_firstname") do
	firstname_searched = params["first_search"]

	patients = JSON.parse(File.read('./patients.txt'))

	erb(:search_firstname, { locals: { patients: patients, firstname_searched: firstname_searched } })
end





