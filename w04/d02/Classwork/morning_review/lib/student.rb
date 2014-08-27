require 'json'
require 'pry'
require 'securerandom'


class Student
  def self.create(student) #we can create this with an actual hash that we type right in, instead of a variable 'student' that stands for a student
    student["id"] = SecureRandom.hex #this adds a new student id every time a new student is added
    students = self.all()
    students.push(student)
    students_json = JSON.generate(students)
    File.write('./students.txt', students_json)
  end

  def self.find_by(key, value)
    self.all().find do |student|
      student[key] == value
    end
  end


  def self.select_by(key, value) #this returns an array of values that match whatever key and value you put in
  # you can search by multiple characteristics: first, last, email
  # just need to adjust your key and value accordingly
    self.all().select do |student|
      student[key] == student[value]
  end

  def self.all()
    return JSON.parse(File.read('./students.txt'))
  end
end