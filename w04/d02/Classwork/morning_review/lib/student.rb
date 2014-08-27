require 'json'

class Student
  def self.create(student)
    students = self.all()
    students.push(student)
    students_json = JSON.generate(students)
    File.write('./students.txt', students_json)
  end

  def self.find_by(key, value)
    self.all().find do |student|
      student[key].downcase == value.downcase
    end
  end

  def self.all()
    return JSON.parse(File.read('./students.txt'))
  end
end