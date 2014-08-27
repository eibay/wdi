require 'json'
require 'securerandom'
require 'pry'

class Shuttle
  def self.all()
    shuttle = JSON.parse(File.read('./shuttles.txt'))
    return shuttle
  end

  def self.create(hash)
    hash["id"] = SecureRandom.hex
    shuttles = Shuttle.all()
    shuttles << hash
    File.write('./shuttles.txt', shuttles.to_json)
  end

  def self.find_by(key, value)
    self.all().find do |shuttle|
      shuttle[key] == value
    end
  end


end
