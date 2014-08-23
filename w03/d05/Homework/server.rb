require 'sinatra'
require 'json'
require 'date'

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

		f = File.read "./patients.db"
		patients = JSON.parse f 

		results = patients.select do |patient|
			# return partial matches as results #
			# such searching for Stew will still return Stewie & 
			# searching for Stewie will still return Stew # 
			params["first_name"].include?(patient["first_name"]) || patient["first_name"].include?(params["first_name"]) 
		end 

		erb :index, {locals: {patients: results, view_name: "All patients w/ first name #{params["first_name"]}"}}
	elsif params["condition"]
		f = File.read "./patients.db"
		patients = JSON.parse f 

		results = patients.select do |patient|
			params["condition"].include?(patient["condition"]) || patient["condition"].include?(params["condition"]) 
		end

		erb :index, {locals: {patients: results, view_name: "All patients w/ condition #{params["condition"]}"}}
	else 

		erb :search 
	end 
end 