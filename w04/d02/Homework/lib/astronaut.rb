require 'json'
require 'securerandom'

class Astronaut
  def self.all()
    astronauts = JSON.parse(File.read('./astronauts.txt'))
    return astronauts
  end

  def self.create(hash)
    hash["id"] = SecureRandom.hex
    astronauts = self.all()
    astronauts << hash
    File.write('./astronauts.txt', astronauts.to_json)
  end

  def self.find_by(key, value)
    self.all().find do |astronauts|
      astronauts[key].downcase == value.downcase
    end
  end
end
