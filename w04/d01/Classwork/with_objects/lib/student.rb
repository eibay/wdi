require 'json'

class Student
  def self.create(student)
    students = self.all()
    students.push(student)
    students_json = JSON.generate(students)
    File.write(File.expand_path(File.dirname(__FILE__)+"/../students.txt"), students_json)
  end

  def self.find_by(key, value)
    self.all().find do |student|
      student[key] == value
    end
  end

  def self.all()
    return JSON.parse(File.read(File.expand_path(File.dirname(__FILE__)+"/../students.txt")))
  end
end


class Dorm
  def self.create(dorm)
    dorms = self.all()
    dorms.push(dorm)
    dorm_json = dorms.to_json
    
    File.write(File.expand_path(File.dirname(__FILE__)+"/../dorms.txt"), dorm_json)
  end

  def self.all()
      return JSON.parse(File.read(File.expand_path(File.dirname(__FILE__)+"/../dorms.txt")))
  end

  def self.find_by(key, value)
    self.all().find do |dorm|
      dorm[key] == value
    end
  end


end