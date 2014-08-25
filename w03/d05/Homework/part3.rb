require 'sinatra'
require 'sinatra/reloader'
require 'pry'
require 'json'

get '/' do

patients = JSON.parse(File.read('./patients.txt'))
erb(:index, {locals: {patients: patients}})

	
end

post '/add' do
	
	first_name = params["first"].capitalize
	last_name = params["last"].capitalize
	condition = params["condition"].downcase

patient = {"first" => first_name, "last" => last_name, "condition" => condition, "full" => first_name+last_name}

patients = JSON.parse(File.read('./patients.txt'))

patients.push(patient)

File.write('./patients.txt', patients.to_json)
	
	erb(:index, {locals: {patients: patients}})

end

get '/add' do 
	erb(:add)
end


get '/search/condition' do
	condition = params["condition"].downcase
	
	shared_condition = []

	patients = JSON.parse(File.read('./patients.txt'))
	patients.each do |patient|
		if condition == patient["condition"]
			shared_condition.push(patient)
		end
	end

	erb(:results, {locals: {patients: shared_condition}})
end


get '/search/name' do
	name = params["name"].capitalize
	
	matched_names = []

	patients = JSON.parse(File.read('./patients.txt'))
	patients.each do |patient|
		if name == patient["first"] 
			matched_names.push(patient)
		end
	end

	erb(:results, {locals: {patients: matched_names}})
end

get '/patient/:patient' do

	patient = params["patient"]
	patients = JSON.parse(File.read('./patients.txt'))
	
	patient_info=[]

	patients.each do |patient_hash|
		if patient_hash["full"] == patient
		 patient_info = patient_hash
		end
	end

	erb(:patient, {locals: {patient: patient_info} })

end





