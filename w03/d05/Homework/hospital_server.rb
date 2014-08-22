require 'sinatra'
require 'sinatra/reloader'
require 'json'
require 'pry'

get("/") do
	all_patients = JSON.parse(File.read("patients.txt"))
	erb(:index, {locals: { patients: all_patients } })
end

get("/search-name") do
	name = params[:name]

	all_patients = JSON.parse(File.read("patients.txt"))

	erb(:search_name, {locals: { patients: all_patients, name: name} })
end

get("/search-condition") do
	condition = params[:condition]

	all_patients = JSON.parse(File.read("patients.txt"))

	erb(:search_cond, {locals: { patients: all_patients, condition: condition } })
end

get('/search-name-results') do
	name = params[:name]
	
	header = "Patients named #{name}"

	erb(:search_results, { locals: { header: header, name: name, condition: condition } }) 
end

get('/search-condition-results') do
	name = " "
	condition = params[:condition]
	header = "Patients with #{condition}"
	erb(:search_results, { locals: { header: header, name: name, condition: condition } }) 
end

post("/add-patient") do
end