require 'json'

# this Class organizes all the methods below it - they're all similar, or all act on the same object
# self means we act on the same class

class Student #we capitalize classes of words
  def self.create(student)
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

  def self.all()
    return JSON.parse(File.read('./students.txt'))
  end
end


class Dorm

    # so basically we wld take the dorm info from the browser via params
    # # then we would create a dorm hash from this info
    # then we would update that hash to include the new dorm info
    # then we would rewrite the file dorms.txt with the new info

  def self.create(dorm)
    dorms = self.all()
    students.push(dorm)
    students_json = JSON.generate(students)
    File.write('./dorms.txt', students_json)
  end

  def self.find_by(key, value)
    self.all().find do |dorm|
      dorm[key] == value
    end
  end

  def self.all()
    return JSON.parse(File.read('./dorms.txt'))
  end
end




     