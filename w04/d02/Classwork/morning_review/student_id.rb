require 'json'
require 'securerandom'
require 'pry'

students = JSON.parse(File.read('./students.txt'))
students.each do |student_hash|
	unless student_hash["id"]  
		student_hash["id"] = SecureRandom.hex
		File.write('./students.txt', students.to_json)
	end
end


