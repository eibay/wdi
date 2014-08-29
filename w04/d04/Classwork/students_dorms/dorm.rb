require 'securerandom'
require 'json'
require_relative './student'

class Dorm
  def self.create(dorm)
    dorms = self.all()

    dorm["id"] = SecureRandom.hex
    dorms.push(dorm)

    dorms_json = JSON.generate(dorms)
    File.write('./dorms.txt', dorms_json)
  end

  def self.find_by(key, value)
    self.all().find do |dorm|
      dorm[key] == value
    end
  end

  def self.select_by(key, value)
    self.all().select do |dorm|
      dorm[key] == value
    end
  end

  def self.all()
    array_of_hashes = JSON.parse(File.read('./dorms.txt'))
    instances = []

    array_of_hashes.each do |dorm|
      instances << self.new(dorm)
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
end