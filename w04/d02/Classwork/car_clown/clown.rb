require 'json'
require 'securerandom'
require 'pry'

class Clown
  def self.create(clown)
    clown["id"] = SecureRandom.hex
    clowns = self.all()
    clowns.push(clown)
    clowns_json = JSON.generate(clowns)
    File.write("./clowns.txt", clowns_json)
  end

  def self.find_by(k,v)
    self.all().find do |clown|
      clown[k] == value
    end
  end

  def self.select_by(k,v)
    self.all().select do |clown|
      clown[k].downcase == value.downcase
    end
  end

  def self.all()
    return JSON.parse(File.read("./clowns.txt"))
    end
  end

binding.pry