require 'json'

def find_by(key, value)
	all_patients = JSON.parse(File.read("patients.txt"))
	patients = []
	all_patients.each do |patient|
		if patient[key] == value
			patients << patient
		end
	end
	return patients
end