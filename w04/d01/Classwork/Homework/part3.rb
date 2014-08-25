require 'sinatra'
require 'sinatra/reloader'
require 'pry'
require 'json'

def all()
	return JSON.parse(File.read('./patients.txt'))
end

def create(patient)
	patients = all()
	patients.push(patient)
	File.write('./patients.txt', patients.to_json)
	return all()
end

def find_by(key, value)
	all().find do |patient|
		patient[key].capitalize == value.capitalize
	end
end

get '/' do
patients = all()
erb(:index, {locals: {patients: patients}})
end

post '/add' do	
	first_name = params["first"].capitalize
	last_name = params["last"].capitalize
	condition = params["condition"].downcase

patient = {"first" => first_name, "last" => last_name, "condition" => condition, "full" => first_name+last_name}
patients = create(patient)	
	erb(:index, {locals: {patients: patients}})
end

get '/add' do 
	erb(:add)
end


get '/search/condition' do
	condition = params["condition"].downcase
	patients = all()
	patient = patients.find do |each_patient|
		each_patient["condition"] == condition
	end
	erb(:patient, {locals: {patient: patient}})
end


get '/search/name' do
	name = params["name"].capitalize
	patients = all()
	patient = patients.find do |each_patient|
		each_patient["first"] == name
	end
	erb(:patient, {locals: {patient: patient}})
end






