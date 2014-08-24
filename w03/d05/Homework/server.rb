require 'sinatra'
require 'json'
require 'date'
require "~/dev/wdi/rosencrantz/w03/d05/Homework/search_by.rb"

get '/' do 
	f = File.read "./patients.db"
	patients = JSON.parse f

	erb :index, {locals: {patients: patients, view_name: "All Patients"}}
end 

get "/appointments" do 
	erb :appointments
end 

post "/appointments" do 

	f = File.read "./doctors.db"
	doctors = JSON.parse f 

	patient = {
		"first_name" => params["first_name"], 
		"last_name" => params["last_name"], 
		"birth_year" => params["birth_year"].to_i, 
		"condition" => params["condition"],
		"date_admitted" => Date.today.to_s, 
		"doctor" => doctors.sample 
	}

	f = File.read "./patients.db"
	patients = JSON.parse f 
	patients << patient 

	File.write "./patients.db", patients.to_json 

	redirect '/'
end 

get "/patients" do
	if params["first_name"]

		results = search_patients_by "first_name", params["first_name"]

		erb :index, {locals: {patients: results, view_name: "All patients w/ first name #{params["first_name"]}"}}
	elsif params["condition"]
		
		results = search_patients_by "condition", params["condition"]

		erb :index, {locals: {patients: results, view_name: "All patients w/ condition #{params["condition"]}"}}
	else 

		erb :search 
	end 
end 