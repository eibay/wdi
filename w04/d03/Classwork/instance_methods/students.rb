require 'json'
require 'pry'
require 'securerandom'
require 'httparty'

class Student

attr_accessor :first
attr_accessor :last
attr_accessor :email
attr_accessor :dorm_id
attr_accessor :id




def initialize(attributes)
	@first=attributes["first"]
	@last=attributes["last"]
	@email=attributes["email"]
	@dorm_id=attributes["dorm_id"]
	@id=attributes["id"]
end

def self.all()
return JSON.parse(File.read("./students.txt"))
end

def self.create(student)
    students = self.all()
    
    student["id"]=SecureRandom.hex
    students.push(student)

    students_json = JSON.generate(students)
    File.write('./students.txt', students_json)
end


def self.find_by(key , value)
	student=self.all()
	student_return=student.find do |student|
	student[key].downcase==value.downcase
	end
	return self.new(student_return)
end
def self.select_by(key , value)
	student=self.all()
	student.select do |student|
	student[key].downcase==value.downcase
	end
	
end


def dorm
	dorms=JSON.parse(File.read("./dorms.txt"))

	dorms.find do |dorm|
		dorm["id"]==@dorm_id
	end
end

def self.random_student

	api=HTTParty.get("http://api.randomuser.me/")
	first=api["results"][0]["user"]["name"]["first"]
	last=api["results"][0]["user"]["name"]["last"]
	email=api["results"][0]["user"]["email"]
   	dorms=JSON.parse(File.read("./dorms.txt"))
   	dorm_id=dorms.sample["id"]

	return self.create({"first" => first , "last" => last, "email"=>email, "dorm_id" => dorm_id})
	
end


end