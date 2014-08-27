require 'sinatra'
require 'json'
require 'httparty'
require 'sinatra/reloader'
require 'json'
require 'pry'

person = {}
info = []
data = []

patients = JSON.parse(File.read('../patients.txt'))
patients_json = JSON.generate(patients)

	patients.each do |patient|
		data = "<ul><h2>#{patient['firstname']} #{patient['lastname']}</h2>
		<li>Admittance Date: #{patient['admittance_date']}</li><li>Condition: #{patient['condition']}<li>Doctor: #{patient['doctor']}</ul>"
		info << data
	end

get("/") do
	user = HTTParty.get('http://api.randomuser.me')
	first_name = user["results"]["user"]["name"]["first"]
	last_name = user["results"]["user"]["name"]["last"]
	
	binding.pry
	erb(:index)
end

post("/register") do
	doctors = JSON.parse(File.read('dr.txt'))
	doctor = doctors.sample
	profile = []

	firstname 		= params["firstname"]
	lastname 		= params["lastname"]
	admittance_date = params["admittance_date"]
	condition 		= params["condition"]

	person["firstname"] = firstname
	person["lastname"] = lastname
	person["admittance_date"] = admittance_date
	person["condition"] = condition
	person["doctor"] = doctor

	profile = "<ul><h2>#{person['firstname']} #{person['lastname']}</h2>
		<li>Admittance Date: #{person['admittance_date']}</li><li>Condition: #{person['condition']}<li>Doctor: #{person['doctor']}</ul>"
	info << profile

	patients = JSON.parse(File.read('../patients.txt'))
	patients << person
	patients_json = JSON.generate(patients)
	File.write('../patients.txt', patients_json)

	erb(:patients, { locals: {info: info.join(' ')}})
end

def find_by(key, value)
	list = []
	data = []
	info = []
	patients = JSON.parse(File.read('../patients.txt'))
	patients.each do |patient|
		if key == "condition" && value == patient["condition"]
			list << patient
			list.each do |something|
				data = "<ul><h2>#{something['firstname']} #{something['lastname']}</h2>
						<li>Admittance Date: #{patients.last['admittance_date']}</li><li>Condition: #{something['condition']}<li>Doctor: #{something['doctor']}</ul>"
				info << data
			end
			return erb(:search, {locals: {info: info.join(' '), key: key, value: value} })
		elsif key == "firstname" && value == patient["firstname"]
			list << patient
			list.each do |something|
				data = "<ul><h2>#{something['firstname']} #{something['lastname']}</h2>
						<li>Admittance Date: #{patients.last['admittance_date']}</li><li>Condition: #{something['condition']}<li>Doctor: #{something['doctor']}</ul>"
				info << data
			end
			return erb(:search, {locals: {info: info.join(' '), key: key, value: value} })
		elsif key == "lastname" && value == patient["lastname"]
			list << patient
			list.each do |something|
				data = "<ul><h2>#{something['firstname']} #{something['lastname']}</h2>
						<li>Admittance Date: #{patients.last['admittance_date']}</li><li>Condition: #{something['condition']}<li>Doctor: #{something['doctor']}</ul>"
				info << data
			end
			return erb(:search, {locals: {info: info.join(' '), key: key, value: value} })
		else
			return erb(:notfound)
		end
	end
end

get("/search") do
	key = params["option"]
	value = params["select"]

	find_by(key, value)
end











