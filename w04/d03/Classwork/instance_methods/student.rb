require "json"

class Student

	def initialize(first, last, email)
		@first = first
		@last = last
		@email = email
	end 

	def add(student)
		students = JSON.parse(File.read("./students.txt"))
		student = []
		student.push(@first, @last, @email)
		students.push(student)
		File.write("./students.txt", students.to_json)
	end

	def self.present_all()
		students = self.all()
		students.each do |student|
		first = student[0] 
		last = student[1]
		email = student[2]
		return "#{first} #{last}, #{email}"
		end
	end


	def self.all()
		return JSON.parse(File.read("./students.txt"))
	end

end

