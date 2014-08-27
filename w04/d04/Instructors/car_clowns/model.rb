require 'json'
require 'securerandom'

class Model
  def self.create(entity)
    entities = self.all()

    entity["id"] = SecureRandom.hex
    entities.push(entity)

    File.write(self.file_name(), entities.to_json)
  end

  def self.find_by(key, value)
    self.all().find do |entity|
      entity[key] == value
    end
  end

  def self.select_by(key, value)
    self.all().select do |entity|
      entity[key] == value
    end
  end

  def self.all()
    return JSON.parse(File.read(self.file_name()))
  end

  def self.file_name()
    self.name().downcase + "s.txt"
  end
end