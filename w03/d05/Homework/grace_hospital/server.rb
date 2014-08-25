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

patient_directory = JSON.parse(File.read("./patient_directory.txt"))
conditions_array = ["the itis", "dia-beetus", "hypoglycemia", "asthma", "elephantitis", "necrotizing fasciitis", "cancer", "not cancer", "'roids", "pica", "old age", "conehead syndrome", "standing desk over-use", "Lindsay Lohan's Disease", "Chris Christie Syndrome", "Rob Ford's Disease", "dead"]

get("/") do
	erb(:index, {locals: {patient_directory: patient_directory}})
end

post("/") do
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

get("/condition_search") do
	erb(:condition_search)
end

get("/name_search") do
	erb(:name_search)
end

get("/search_results") do
	# binding.pry
	n=0
	
	if params.flatten[0] == "query_condition"
		results_array = []
		while n < patient_directory.length
			if params["query_condition"].downcase == patient_directory[n]["condition"].downcase
				results_array.push(patient_directory[n])
			end
			n += 1
		end
	elsif params.flatten[0] == "query_first"
		results_array = []
		while n < patient_directory.length
			if params["query_first"] == patient_directory[n]["first"]
				results_array.push(patient_directory[n])
			end
			n += 1
		end
	end
	erb(:search_results, {locals: {results: results_array}})
end

