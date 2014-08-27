require 'securerandom'
require 'json'

class Shuttle
  def self.create(shuttle)
    shuttles = self.all()

    shuttle["id"] = SecureRandom.hex
    shuttles.push(shuttle)

    shuttles_json = JSON.generate(cars)
    File.write('./shuttles.txt', shuttles_json)
  end

  def self.find_by(key, value)
    self.all().find do |shuttle|
      shuttle[key] == value
    end
  end

  def self.select_by(key, value)
    self.all().select do |shuttle|
      shuttle[key] == value
    end
  end

  def self.all()
    return JSON.parse(File.read('./shuttles.txt'))
  end
end