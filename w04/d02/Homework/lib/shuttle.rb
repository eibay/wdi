require 'securerandom'
require 'json'

class Shuttle
  def self.create(shuttle)
    shuttles = self.all()

    shuttle["id"] = SecureRandom.hex
    shuttles.push(shuttle)

    shuttles_json = JSON.generate(shuttles)
    File.write("./shuttles.txt", shuttles_json)
  end

  def self.find_by(k,v)
    self.all().find do |shuttle|
      shuttle[k] == v
    end
  end

  def self.select_by(k,v)
    self.all().select do |shuttle|
      shuttle[k] == v
    end
  end

  def self.all()
    return JSON.parse(File.read("./shuttles.txt"))
  end
end # ends shuttle class