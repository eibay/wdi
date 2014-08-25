require 'json'

def find_by(key, value)
	all_patients = JSON.parse(File.read("patients.txt"))
	all_patients.each do |patient|
		if patient[key] == value
			return patient
		end
	end
end