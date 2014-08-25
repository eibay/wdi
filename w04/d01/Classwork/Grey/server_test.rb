require 'json'
require 'sinatra'
require 'sinatra/reloader'
require 'pry'

get("/") do
	patients = JSON.parse(File.read('./patients.txt'))

	erb(:index, { locals: { patients: patients} })
end

post("/patient") do
  first_name = params["first"]
  last_name = params["last"]
  admit_date = params["admit_date"]
  condition = params["ailment"]

  patient = {"first"=>first_name, "last"=>last_name, "admit_date"=>admit_date, "ailment"=>condition}

  # students is an array
  patients = JSON.parse(File.read('./patients.txt'))
  # add hash to array
  patients.push(patient)
  # convert students array to JSON
  patients_json = JSON.generate(patients)
  # takes 2 args, file to write and what to write
  File.write('./patients.txt', patients_json)

  erb(:index, {locals: { patients: patients } }) #Why do I need this line?
end

get("/patient") do
	erb(:patient_admit)
end

post("/condition") do
  search_this = params["cond_search"]

  patients = JSON.parse(File.read('./patients.txt'))
  thing = patient["ailment"].downcase


  def search(search_this)
    patients_by_whatever = []

    num_w_whatever = 0
    num_wo_whatever = 0

    patients.each do |patient|
      if patient["ailment"].downcase  ==  search_this.downcase
        patients_by_whatever.push(patient)
        num_w_whatever += 1
      else
        num_wo_whatever += 1
      end
    end

    if num_wo_whatever == patients.count
      no_patients_wailment = true
    end
  end

  erb(:by_condition, {locals: { patients_by_condition: patients_by_condition,  condition_search: condition_search, patients: patients, no_patients_wailment: no_patients_wailment} }) 
end

get("/condition") do
  erb(:condition_search)
end

post("/firstname") do
  firstname_search = params["firstname"]
  patients_by_firstname = []

  patients = JSON.parse(File.read('./patients.txt'))

  num_wsame_firstname = 0
  num_wo_firstname = 0

  patients.each do |patient|
    if patient["first"].downcase  ==  firstname_search.downcase
      patients_by_firstname.push(patient)
      num_wsame_firstname += 1
    else
      num_wo_firstname += 1
    end
  end

  if num_wo_firstname == patients.count
    no_patients_wname = "Nobody in this hospital has #{firstname_search}"
  end

  erb(:by_firstname, {locals: { patients_by_firstname: patients_by_firstname,  firstname_search: firstname_search, patients: patients, no_patients_wname: no_patients_wname} }) 
end

get("/firstname") do
  erb(:firstname_search)
end


