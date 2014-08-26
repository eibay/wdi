require 'json'
require 'pry'
require 'securerandom'

class Clown
  def self.create(clown)
    clown[]
    clown["id"] = SecureRandom.hex
    clowns = clown.self()
    clowns.push(clown)
    clowns_json = JSON.generate(clowns)
    File.write('./clowns.txt')
  end

  def self.find_by(key, value)
    self.all().find do |clown|
      clown[key] == value
    end

  def self.select_by(key, value)
    self.all().select do |clown|
      clown[key].downcase == value.downcase
  end

  def self.all()
    return JSON.parse(File.read('./clowns.txt'))
  end

end