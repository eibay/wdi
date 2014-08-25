require 'sinatra'
require 'json'
require 'pry'
require 'sinatra/reloader'
require 'httparty'

get("/") do
	patients = JSON.parse(File.read('./patients.txt'))
	erb(:list, { locals: { patients: patients } })
end

def add_patient(first, last, admit_date, condition) 
	# make hash of new patient information
	patient = { "first" => first, "last" => last, "admit_date" => admit_date, "condition" => condition}

	# get all patients text
	patients = JSON.parse(File.read('./patients.txt'))

	# add new patient to all patients
	patients << patient

	# save all patients text
	patients_json = JSON.generate(patients)
	File.write('./patients.txt', patients_json)
end

post("/")  do
		# gather new patient information from form
		first = params["first"]
		last = params["last"]
		admit_date = params["admit_date"]
		condition = params["condition"]
	
add_patient(first, last, admit_date, condition)
# binding.pry
	# display list page with all patients information
	erb(:list, { locals: { patients: patients } })
end

get("/new_patient_random") do
	# gather new patient information from form
	response = HTTParty.get("http://api.randomuser.me")
	first = response["results"][0]["user"]["name"]["first"].capitalize
	last = response["results"][0]["user"]["name"]["last"].capitalize
	erb(:new_patient_random, {locals: { first: first, last: last} })
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

