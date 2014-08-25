require 'json'
require 'sinatra'
require 'pry'
require 'sinatra/reloader'
require 'HttParty'

def doctor
  splitting = File.read("./greys1.txt")
  splitting = splitting.gsub("\n", ",") 
  names = splitting.split(",")
  array =[]
  while names[0]
    empty = {}
    empty[:actor] = names[0]
    names.delete_at(0)
    empty[:character] = names[0]
    names.delete_at(0)
    empty[:episodes] = names[0]
    names.delete_at(0)
    if names[0].length > 4
      year = names[0].split("-")
      names.delete_at(0)
      empty[:start_year] = year[0]
      empty[:end_year] = year[1]
    end
    if names[0].length < 5
      empty[:start_year] = names[0]
      names.delete_at(0)
    end
  array << empty
  end 
  doctor =[]
  array.each do|x|
    if x[:character].include?"Dr."
     doctor << x[:character]
    end
  end
  
  doctorshuffle = doctor.shuffle
  return doctorname = doctorshuffle[0].delete(" ")
end


get("/") do
  list = JSON.parse(File.read("./patient.txt"))
  erb(:index, {locals:{list: list} }) 
  end
  
get("/random") do
  values = HTTParty.get("http://api.randomuser.me")
  firstname = values["results"][0]["user"]["name"]["first"].capitalize
  lastname = values["results"][0]["user"]["name"]["last"].capitalize
  doctor
  erb(:random,{locals: {firstname:firstname, lastname: lastname, doctorname: doctor}})
end

get("/newpatient") do
  doctor
  erb(:add, {locals:{doctorname: doctor}}) 
end

post("/newpatient") do
  firstname = params["firstname"].capitalize
  lastname = params["lastname"].capitalize
  date = params["date"]
  condition = params["condition"].capitalize
  doctorname = params["doctorname"]
  patient1 = {"name" => firstname, "last" => lastname, "date" => date, "condition" => condition, "doctorname" => doctorname}
  list = JSON.parse(File.read("./patient.txt"))
  list << patient1
  File.write("./patient.txt", list.to_json)
  erb(:index, {locals:{list: list, doctorname: doctorname} })
end

get("/condition") do
  erb(:conditionsearch)
end

get("/name") do
  erb(:namesearch)
end

get("/results") do
  results = JSON.parse(File.read("./patient.txt"))
  condition = params["condition"].capitalize
  erb(:results, {locals:{condition: condition, results: results}})
end 


get("/results1") do
  results = JSON.parse(File.read("./patient.txt"))
  name = params["name"].capitalize
  erb(:results1, {locals:{name: name, results: results}})
end 






 







