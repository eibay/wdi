require 'json'

#order of method does not matter

class Student
  #is a thing in ruby so has interesting features
  #class it just organizing our methods 
  #under something we call namespace
  def self.create(student)
    #self we need to access this to access 
    #the class-will find out tomorrow
    students = self.all()
    students.push(student)
    students_json = JSON.generate(students)
    File.write('./students.txt', students_json)
    #because up one file ..
  end

  def self.find_by(key, value)
    self.all().find do |student|
      student[key] == value
    end
  end

  def self.all()
    return JSON.parse(File.read('./students.txt'))
  end
end
#end of class
#wrap them in classes based on ideas


class Dorm
  def self.all()
    return JSON.parse(File.read('./dorms.txt'))
  end

  def self.create(dorm)
    dorms = self.all()
    dorms << dorm
    File.write('./dorms.txt', dorms.to_json)
  end

 def self.find_by(key, value)
  self.all().find do |dormname|
    dormname[key].downcase == value.downcase
  end
end
end









