require 'json'
require 'date'
require 'sinatra'
require 'sinatra/reloader' if development?

get "/" do
	@title = "Patient Listing"
	@patients = JSON.parse(File.read("patients.txt"))
	erb :index
end

get "/new" do
	erb :new
end

post "/" do
	patient = {
		first: params["first"],
		last: params["last"],
		condition: params["condition"],
		date_time_admittance: Date.today
	}
	@patients = JSON.parse(File.read("patients.txt"))
	@patients.push(patient)

	patients_json = JSON.generate(@patients)
	File.open("patients.txt", "w") do |f|
		f.puts(patients_json)
	end

	redirect to "/"
end

get "/search" do
	erb :search
end

get "/results" do
	patients = JSON.parse(File.read("patients.txt"))
	if params["first"]
		patients = patients.select do |p|
			p["first"].downcase =~ Regexp.new(params["first"].downcase)
		end
		@title = "All patients matching first name #{params["first"]}"
	elsif params["condition"]
		patients = patients.select do |p|
			p["condition"].downcase =~ Regexp.new(params["condition"].downcase)
		end
		@title = "All patients matching condition #{params["condition"]}"
	end

	@patients = patients
	erb :index
end


# post("/students") do 
# 	first_name = params["first"]
# 	last_name = params["last"]
# 	date_time_admittance = parmas["date_admitted"]
# 	condition = params["condition"]