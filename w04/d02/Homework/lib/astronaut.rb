require 'securerandom'
require 'json'

class Astronaut
  def self.create(astronaut)
    astronauts = self.all()

    astronaut["id"] = SecureRandom.hex
    astronauts.push(astronaut)

    astronauts_json = JSON.generate(astronauts)
    File.write("./astronauts.txt", astronauts_json)
  end

  def self.find_by(k, v)
    self.all().find do |astronaut|
      astronaut[k] == v
    end
  end

  def self.select_by(k,v)
    self.all().select do |astronaut|
      astronaut[k] == v
      end
    end

  def self.all()
    return JSON.parse(File.read("./astronauts.txt"))
  end
end #ends astronaut class