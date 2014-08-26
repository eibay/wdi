require 'sinatra'
require 'sinatra/reloader'
require 'json'
require 'pry'

patients = JSON.parse(File.read('./patient_list.txt'))

get "/" do


  erb(:index, locals: {patients: patients})
end

get "/patients" do


  erb(:patients, locals: {patients: patients})
end

post "/patients" do

new_patient = {"first_name" => params["first_name"], "last_name" => params["last_name"], "date_admitted" => params["date_admitted"], "condition" => params["condition"]}

patients << new_patient

patients_json = JSON.generate(patients)

File.write('./patient_list.txt', patients_json)

  erb(:patients, locals: {patients: patients})
end

get "/name_search" do

  erb(:name_search, {locals: {patients: patients}})
end

post "/name_results" do
  patients = JSON.parse(File.read('./patient_list.txt'))

  patients.each do |p|
    if params["query"].capitalize == p["first_name"]
      result = "#{p['first_name']} #{p['last_name']}: #{p['date_admitted']} -- #{p['condition']}"
    end
  end


  erb(:name_results, {locals: {patients: patients}, result: result})
end


get "/condition_search" do

  erb(:condition_search, {locals: {patients: patients}})
end

post "/condition_results" do

  erb(:condition_results, {locals: {patients: patients}})
end
