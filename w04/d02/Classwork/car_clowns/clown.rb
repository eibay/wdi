require 'securerandom'
require 'json'

class Clown
  def self.create(clown) #this adds the new clown entry to the clowns array (json txt file)
    clowns = self.all()

    clown["id"] = SecureRandom.hex
    clowns.push(clown)

    clowns_json = JSON.generate(clowns)
    File.write('./clowns.txt', clowns_json)
  end

  def self.find_by(key, value)
    self.all().find do |clown|
      clown[key] == value
    end
  end

  def self.select_by(key, value)
    self.all().select do |clown|
      clown[key] == value
    end
  end

  def self.all()
    return JSON.parse(File.read('./clowns.txt'))
  end
end