class Student

attr_accessor :first
attr_accessor :last
attr_accessor :email

def initialize(first, last, email)
	@first=first
	@last=last
	@email=email
end

def list_student

	
		puts "#{@first} #{@last}- #{@email}"
	
end

def self.list_all_students(file, first, last, email)
json_parsed_file=JSON.parse(File.read(file))

json_parsed_file.push({"first"=>first, "last"=>last, "email"=>email})
File.write("./students.txt" , json_parsed_file.to_json)
students=JSON.parse(File.read(file))


students.each do |student|

	x=Student.new(student["first"],student["last"],student["email"])

	x.list_student
end
end


end