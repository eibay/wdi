require 'json'
require 'securerandom'

class Shuttles

def self.list()
  JSON.parse(File.read("./shuttles.txt"))
end

def self.add(shuttle)
  shuttles= Shuttles.list
  shuttle["id"] = SecureRandom.hex
  shuttles << shuttle
  File.write("./shuttles.txt", shuttles.to_json)
end


def self.find_by(k,v)
  Shuttles.list().find do |shuttle|
  shuttle[k] == v
end
end

def self.select_by(k,v)
  Shuttles.list().select do |shuttle|
  shuttle[k] == v
end
end
end