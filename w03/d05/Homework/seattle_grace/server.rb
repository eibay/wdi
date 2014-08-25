require 'sinatra'
require 'sinatra/reloader'
require 'json'
require 'pry'
require 'httparty'
require './short_cut.rb'

doctors = JSON.parse(File.read("./data/doctors.txt"))

common_condition = ["hepatitis", "chlamydia", "meningitis", "giardiasis", "stroke", "trichomaniasis", "physical trauma", "intestinal polyps"]

get "/" do
	roster = JSON.parse(File.read("./data/patients.txt"))
	erb(:index, {locals: { roster: roster, doctors: doctors } })
end

# This get will use the request param, embedded in the link, to fill the search view.
get "/search" do
	type_proper = "First Name" if params["type"] == "firstname"
	type_proper = "Condition" if params["type"] == "condition"
	erb(:search, {locals: { type: params["type"], type_proper: type_proper } })
end

# Here's my find_by method in action:
get "/search/condition" do
	list = []
	roster = JSON.parse(File.read("./data/patients.txt"))
	list = find_by("condition", params["term"].downcase, roster)

	#Below is how it looks without the method.  Ugly, right?

	# roster.each do |patient|
	# 	if patient["condition"] == params["term"].downcase
	# 		list << "#{patient["first"]} #{patient["last"]}: #{patient["condition"]}"
	# 	end
	# end

	erb(:results, {locals: { list: list, search: "Condition" } })
end

# Did you see that? Here it is again.  Notice I loaded it from another file, like a boss.
get "/search/firstname" do
	list = []
	roster = JSON.parse(File.read("./data/patients.txt"))
	list = find_by("first", params["term"].downcase.capitalize, roster)
	erb(:results, {locals: { list: list, search: "First Name" } })
end

get "/patient/admit" do
	erb(:check_in)
end

post "/patient/random" do

	request = HTTParty.get("http://api.randomuser.me/")
	new_patient = request["results"][0]["user"]
	roster = JSON.parse(File.read("./data/patients.txt"))
	roster << {
		"first" => new_patient["name"]["first"].capitalize,
		"last" => new_patient["name"]["last"].capitalize,
		"condition" => common_condition[rand(0..6)],
		"admitted" => Time.now.strftime("%B %-d, %Y"),
		"doctor" => "none"
	}
	json_roster = JSON.generate(roster)
	File.write("./data/patients.txt", json_roster)
	erb(:index, {locals: { roster: roster, doctors: doctors } })	
end

post "/patient" do
	roster = JSON.parse(File.read("./data/patients.txt"))
	roster << {
		"first" => params["first"],
		"last" => params["last"],
		"condition" => params["condition"].downcase,
		"admitted" => Time.now.strftime("%B %-d, %Y"),
		"doctor" => "none"
	}
	json_roster = JSON.generate(roster)
	File.write("./data/patients.txt", json_roster)
	erb(:index, {locals: { roster: roster, doctors: doctors } })	
end

post "/doctor" do
	roster = JSON.parse(File.read("./data/patients.txt"))
	roster.each do |patient|
		if "#{patient["first"]} #{patient["last"]}" == params["patient"]
			patient["doctor"] = params["doctor"]
		end
	end
	json_roster = JSON.generate(roster)
	File.write("./data/patients.txt", json_roster)
	erb(:index, {locals: { roster: roster, doctors: doctors } })
end