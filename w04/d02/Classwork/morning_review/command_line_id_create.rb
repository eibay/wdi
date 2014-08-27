# goal - generate user ids for each student in our student.txt file

require 'json'
require 'securerandom'
require 'pry'

students = JSON.parse(File.read('./students.txt'))
students.each do |student_hash|
	unless student_hash["id"]  #this means - unless there is an ID already in the student hash, do this
		student_hash["id"] = SecureRandom.hex
		File.write('./students.txt', students.to_json)
	end
end