require 'json'
require 'pry'
require 'securerandom'

class Student
  def self.create(student)
<<<<<<< HEAD
    student["id"] = SecureRandom
=======
    student["id"] = SecureRandom.hex
>>>>>>> aa19ae307d44924e4f14baebc98213fbc7a686ff
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

  def self.select_by(key, value)
    self.all().select do |student|
      student[key].downcase == value.downcase
    end
  end

  def self.all()
    return JSON.parse(File.read('./students.txt'))
  end
end