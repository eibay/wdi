require 'securerandom'
require 'json'
require_relative './dorms.txt'
require_relative './students.txt'

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
      instances << self.new(student)
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

  # def dorm(dorm_id)
  #   Student.all().each do |student|
  #     dorm_id = student["dorm_id"]
  #   end
  #   return dorm_id
  # end

  # def dorm()
  #   @attributes["dorm_id"]
  # end

  # dorm(@attributes["dorm_id"], )

end