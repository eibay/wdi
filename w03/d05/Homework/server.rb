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
	patient = {}

	patient["first_name"] = params["first_name"]
	patient["last_name"] = params["last_name"]
	patient["birth_year"] = params["birth_year"]
	patient["birth_year"] = params["condition"]
	patient["date_admitted"] = Date.today.to_s 

	f = File.read "./patients.db"
	patients = JSON.parse f 
	patients << patient 

	File.write "./patients.db", patients 

	redirect '/'
end 