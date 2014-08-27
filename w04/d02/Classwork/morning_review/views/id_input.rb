require 'json'
require 'securerandom'









student = {"first" => first_name, "last" => last_name, "email" => email, "id" => id}
students = JSON.parse(File.read('./students.txt'))
students.push(student)
students_json = JSON.generate(students)
students.push(student)
File.write('./students.txt', student_json)

students.each do |id|
	id["id"] = SecureRandom.hex
	students.push(students["id"])
end
