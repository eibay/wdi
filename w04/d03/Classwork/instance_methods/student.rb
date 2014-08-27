require "json"

class Student

	def initialize(first, last, email)
		students = self.all()
		student = []
		@first = first
		@last = last
		@email = email
		student.push(@first, @last, @email)
		students.push(student)
		File.write("./students.txt", students.to_json)
	end 

	def self.print_all()
		students = self.all()
		students.each |student|
		first = student[0] 
		last = student[1]}
		email = student[2]
		puts "#{first} #{last}, #{email}"
		end
	end


	def self.all()
		return JSON.parse(File.read("./students.txt"))
	end

end

