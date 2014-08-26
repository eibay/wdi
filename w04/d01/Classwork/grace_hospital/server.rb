# Objective: Create a server to add and view patients

# Spec:
# Create a root page that lists all patients, including 
# their First Name, Last Name, and Condition.
# Create a page to add a patient
# Create a page to search for patients by condition, handling 
# the case where there are multiple patients in the results
# Create a page to search for patients by First Name only, 
# handling the case where there are multiple patients in the results


require "json"
require "pry"
require "httparty"
require "sinatra"
require "sinatra/reloader"


conditions_array = ["the itis", "dia-beetus", "hypoglycemia", "asthma", "elephantitis", "necrotizing fasciitis", "cancer", "not cancer", "'roids", "pica", "old age", "conehead syndrome", "standing desk over-use", "Lindsay Lohan's Disease", "Chris Christie Syndrome", "Rob Ford's Disease", "dead"]

get("/") do
	patient_directory = JSON.parse(File.read("./patient_directory.txt"))
	erb(:index, {locals: {patient_directory: patient_directory}})
end

post("/") do
	patient_directory = JSON.parse(File.read("./patient_directory.txt"))
	if params.flatten[0] == "first"
		new_patient = {}
		new_patient["first"] = params["first"]
		new_patient["last"] = params["last"]
		new_patient["condition"] = params["condition"]
		patient_directory << new_patient
		File.write("./patient_directory.txt", patient_directory.to_json)
		erb(:index, {locals: {patient_directory: patient_directory}})
	else
		new_patient = {}
		response = HTTParty.get("http://api.randomuser.me")
		new_patient["first"] = response["results"][0]["user"]["name"]["first"].capitalize
		new_patient["last"] = response["results"][0]["user"]["name"]["last"].capitalize
		new_patient["condition"] = conditions_array.sample
		patient_directory << new_patient
		File.write("./patient_directory.txt", patient_directory.to_json)
		erb(:index, {locals: {patient_directory: patient_directory}})
	end
		
end

get("/new_patient") do
	erb(:new_patient_form)
end

get("/search") do
	erb(:search)
end

get("/search_results") do
	patient_directory = JSON.parse(File.read("./patient_directory.txt"))
	if params["search_type"] == "condition"
		results_array = patient_directory.find_all do |patient|
			params["search_word"].downcase == patient["condition"].downcase
			end
	elsif params["search_type"] == "first"
		results_array = patient_directory.find_all do |patient|
			params["search_word"].downcase == patient["first"].downcase
		end
	end
	erb(:search_results, {locals: {results: results_array}})
end

