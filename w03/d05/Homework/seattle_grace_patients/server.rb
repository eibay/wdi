require 'json' #normally use to parse ruby hashes.
require 'sinatra'
require 'sinatra/reloader'
require 'pry'

time = time.new

puts 'Welcome to Seattle Grace Hospital. What is your name?'

name = gets.chomp
puts "Welcome to Seattle Grace Hospital, #{name}."

while true 
	puts 'How would you describe your current condition? Please let me know if it is good, fair, poor.'
	answer = gets.chomp.downcase
	if (answer == 'good' || answer == 'fair' || answer == 'poor')
		break
	else 
		puts 'Please answer good, fair, or poor'
	end

	<%= Time.now.strftime("%m/%d/%Y") %>


patients = JSON.parse(File.read('./patients.txt'))
patients.push(patient)
patients_json = JSON.generate(patients)
File.write('./patients.txt' patients.json)

  erb(:index, { locals: { patients: patients }})
end

post("/patients") do
	first_name = params["first"]
	last_name = params["last"]
	day_of_admittance = parmas["date_admitted"]
	condition = params["condition"]

patient = {"first" => first_name, "last" => last_name, "date of admittance" => date_admitted, "condition" => condition}