require 'json'

class Clown
  def self.create(clown)
    clowns = self.all()
    clowns.push(clown)
    File.write('./clowns.txt', clowns.to_json)
  end

  def self.find_by(key, value)
    self.all().find do |clown|
      clown[key] == value
    end
  end

  def self.all()
    return JSON.parse(File.read('./clown.txt'))
  end
end