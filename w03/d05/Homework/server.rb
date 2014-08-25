require 'json'
require 'sinatra'
require 'sinatra/reloader'
require 'pry'

	get("/") do

		patient_info = JSON.parse(File.read('./patient_info.txt'))

		erb(:index, { locals: { patient_info: patient_info } })

	end

		get("/add") do

		erb(:new_patient)

	end

	post("/add") do

		first_name = params["first"].capitalize
	  last_name = params["last"].capitalize
	  date = params["date"]
	  condition = params["condition"].downcase

	  data = {"first" => first_name, "last"=> last_name, "admittance" => date, "condition" => condition}

	  new_patients = JSON.parse(File.read('./patient_info.txt'))

	  new_patients.push(data)

	  patients_json = JSON.generate(new_patients)

	  File.write('./patient_info.txt', patients_json)

		erb(:new_patient)

	end

		get("/search") do

	  erb(:search)

	end

	post("/search") do

		first_name = params["first"]
	  last_name = params["last"]
	  date = params["date"]
	  condition = params["condition"].downcase
	
		patient_info = JSON.parse(File.read('./patient_info.txt'))

  	erb(:results, { locals: { patient_info: patient_info, condition: condition, first: first_name } })

	end

	post("/search_name") do

		first_name = params["first"].capitalize
	  last_name = params["last"]
	  date = params["date"]
	  condition = params["condition"]
	
		patient_info = JSON.parse(File.read('./patient_info.txt'))

  	erb(:results_name, { locals: { patient_info: patient_info, condition: condition, first: first_name } })

	end