require 'json'
require 'pry'
require 'SecureRandom'

patients = JSON.parse(File.read('./patients.txt'))
# binding.pry

patients.each do |patient|
	patients.push(patient["id"] => SecureRandom.hex(13))
end

File.write('./patients.txt', patients.to_json)


# patients_json = JSON.generate(patients)

# File.write('./patients.txt', patients_json)