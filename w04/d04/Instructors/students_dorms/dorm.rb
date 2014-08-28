require 'securerandom'
require 'json'

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
    return JSON.parse(File.read('./dorms.txt'))
  end
end