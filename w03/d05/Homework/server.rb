require 'sinatra'
require 'pry'
require 'json'


patient = []
patients = JSON.parse(File.read("./patients.txt"))

get("/") do 
	patients
	erb(:index, {locals: {patients: patients}})
end 

post ("/new_patient") do 
	patients << params
	File.write("./patients.txt", patients.to_json)
	erb(:new_patient)
end

get ("/new_patient_form") do	
	erb(:new_patient_form)
end

get("/search") do 
	erb(:search)
end

get("/search_results_c") do 
	patient_name = ""
	condition = params["condition"]
	patient_w_condition = ""
	patients.select do |a|
		if a["condition"] == condition
			patient_w_condition << a["condition"] + ", " + a["first"] + " " + a["last"] + "<br>"
		end
	end
	erb(:search_results, {locals: { condition: patient_w_condition, name: patient_name}})
end

get("/search_results_n") do 

	first = params["first"]
	patient_w_condition =""
	patient_name = ""
	patients.select do |a|
		if a["first"] == first
			patient_name << a["condition"] + ", " + a["first"] + " " + a["last"] + "<br>"
		end
	end
	erb(:search_results, {locals: { name: patient_name, condition: patient_w_condition}})
end