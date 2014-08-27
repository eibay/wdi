require 'pry'
require 'selectrandom'


patient = {first: first_name, last: last_name, date_time_admittance: Date.today, condition: condition}

patients = JSON.parse(File.read('./patients.txt'))
patients.push(patient)
patients_json = JSON.generate(patients)
File.open('./patients.txt', 'w') do |f|
	f.puts(patients_json)
end