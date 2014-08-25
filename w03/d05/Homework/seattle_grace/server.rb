require 'json'
require 'sinatra'
require 'sinatra/reloader'
require 'pry'


# this is to display the index page
get("/") do
  erb(:index)
end


# this is to display and receive form info
post("/patients") do
  first_name = params["first"]
  last_name = params["last"]
  admit_date = params["admit_date"]
  # condition = params["condition"]
  # thinking we should make this lowercase so we can have some search uniformity
  # wondering also about spacing - if there's any way to make that uniform?
  condition = params["condition"].downcase

  person = {"first" => first_name, "last" => last_name, "admit_date" => admit_date, "condition" => condition}


  # not sure if i need this line because there is nothing in the file yet to read for the first patient entry
# for the first patient hash entry do i need to initialize the array?
#   patients = []


  # patients is an array
  patients = JSON.parse(File.read('./patients.txt'))
  # add hash to array
  patients.push(person)
  # convert patients array to JSON
  patients_json = JSON.generate(patients)
  # takes 2 args, file to write and what to write
  File.write('./patients.txt', patients_json)

  erb(:index, {locals: { patients: patients } })
end


# to display patients
get("/patients") do
  patients = JSON.parse(File.read('./patients.txt'))
  erb(:patients, { locals: { patients: patients} })
end


# /////////////

# PART 2 - 

# - This should be a separate program from Part 1, but should use the same file with the patients data.

# QUESTION - WHEN WE SAY SEPARATE PROGRAM BUT NOT SEPARATE RUBY SERVER (WHICH PART 3 SAYS - DOES THAT MEAN WE KEEP IT IN THE SAME DOCUMENT?)

# - **Objective**: Create a command line application to search for patients by condition
# - **Spec**:
#     - Your application should ask the user for a single condition
#     - **All** patients with that condition should be printed to the terminal, including their First Name, Last Name, and Date of Admittance


# assuming this stays outside the get loop?
patients_with_condition = []


get("/form_for_patient_condition") do
  erb(:form_for_patient_condition)
end

post("/condition") do

condition_search = params["condition_search"].downcase

patients = JSON.parse(File.read('./patients.txt'))

i think this goes in the .erb document instead of here on the server but not sure

patients.each do |patient|
  # wondering if we could also do person here (since we established that this is the name of the patient hash above)
      if patient["condition"] == condition_search
          patients_with_condition << "#{patient["first_name"]} + #{patient["last_name"]} + #{patient["admit_date"]}"  
      end
end

# maybe we could also push the entire 'patient' hash to the array? except for the fact that we dont really need to display the condition again


  # patients is an array

  # not sure if i need this line because there is nothing in the file yet to read for the first patient entry

# for the first patient hash entry do i need to initialize the array?
#   patients = []

 
  erb(:index, {locals: { patients: patients } })
end



end



  patients = JSON.parse(File.read('./patients.txt'))
  


# === Stars

stars = []

all_actors.each do |actor|
  if actor[:episodes] > 150
    stars.push(actor[:name])
  end
end

# === Minor peeps

minor = []

all_actors.each do |actor|
  if actor[:episodes] < 10
    minor.push(actor[:name])
  end
end

#=== Dr



#=== 2007
aught_seven = []

all_actors.each do |actor|
  # aught_seven << actor[:character] if actor[:start_year]  2007
  if actor[:start_year] <= 2007 && actor[:end_year] >= 2007
    aught_seven << actor[:character]
  end
end

# binding.pry



















