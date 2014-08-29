require 'securerandom'
require 'json'

class Student
  def self.create(student)
    students = self.all()

    student["id"] = SecureRandom.hex
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
      student[key] == value
    end
  end

  def self.all()
    array_of_hashes = JSON.parse(File.read('./students.txt'))
    instances = []

    array_of_hashes.each do |student|
      instances << Student.new(student)
    end

    return instances
  end

  # Instances

  def initialize(attributes)
    @attributes = attributes
  end

  # don't worry about this one
  def to_json
    @attributes.to_json
  end

  def [](key)
    return @attributes[key]
  end

  def students
    Student.select_by("dorm_id", @attributes["id"])
    #return ALL the students with the dorm_id of the current dorm.
  end

  def hello 
    return "My name is #{@attributes["first"]}"
  end

  def dorm 
    Dorm.find_by("id", @attributes["dorm_id"])
    ### returns the Dorm object for this student
  end

end
