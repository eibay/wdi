require 'sinatra'
require 'json'
require 'date'

get '/' do 
	f = File.read "./patients.db"
	patients = JSON.parse f

	erb :index, {locals: {patients: patients}}
end 

get "/appointments" do 
	erb :appointments
end 

post "/appointments" do 
	
	patient = {
		"first_name" => params["first_name"], 
		"last_name" => params["last_name"], 
		"birth_year" => params["birth_year"], 
		"condition" => params["condition"],
		"date_admitted" => Date.today.to_s  
	}

	f = File.read "./patients.db"
	patients = JSON.parse f 
	patients << patient 

	File.write "./patients.db", patients.to_json 

	redirect '/'
end 