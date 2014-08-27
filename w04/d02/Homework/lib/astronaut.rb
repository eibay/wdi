require 'json'
require 'securerandom'

class Astronauts

def self.list()
  JSON.parse(File.read("./astronauts.txt"))
end

def self.add(astronaut)
  astronauts = Astronauts.list
  astronaut["id"] = SecureRandom.hex
  astronauts << astronaut
  File.write("./astronauts.txt", astronauts.to_json)
end

def self.find_by(k,v)
  Astronauts.list().find do |astronaut|
  astronaut[k] == v
end
end

def self.select_by(k,v)
  Astronauts.list().select do |astronaut|
  astronaut[k] == v
end
end
end