require 'json'
require 'sinatra'
require 'sinatra/reloader'
require 'pry'



def all()
	return JSON.parse(File.read('./students.txt'))
end

def create(student)
	students = all()
	students.push(student)
	File.write('./studnets.txt', students.to_json)
end

def find_by(key,value)
	all().find do |student|
		student[key] == vlaue
	end
end

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

get("/condition/:condition") do
	patients = JSON.parse(File.read('./patientinfo.txt'))
  	result = patients.find do |patient|
    patient["condition"].downcase == params[:condition].downcase
end
	erb(:conditionpost, {locals: { result: result } } )

end



