require 'securerandom'
require 'json'

class Astronaut
  def self.create(astronaut)
    astronauts = self.full_array()
    astronaut["id"] = SecureRandom.hex
    astronauts << astronaut
    File.write('./astronauts.txt', astronauts.to_json)
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
    return JSON.parse(File.read('./astronauts.txt'))
  end
end