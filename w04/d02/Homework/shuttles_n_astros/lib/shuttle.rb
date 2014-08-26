require 'securerandom'
require 'json'

class Shuttle
  def self.create(shuttle)
    shuttles = self.full_array()
    shuttle["id"] = SecureRandom.hex
    shuttles << shuttle
    File.write('./shuttles.txt', shuttles.to_json)
  end

  def self.find_by(key, value)
    self.full_array().find do |x|
      x[key] == value
    end
  end

  def self.select_by(key, value)
    self.full_array().select do |x|
      x[key] == value
    end
  end

  def self.full_array()
    return JSON.parse(File.read('./shuttles.txt'))
  end
end