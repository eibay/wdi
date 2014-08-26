require 'json'

class Mechanic
  def self.all()
    mechanics = JSON.parse(File.read('./mechanics.txt'))
    return mechanics
  end

  def self.create(hash)
    mechanics = Mechanic.all()
    mechanics << hash
    mechanics_json = JSON.generate(mechanics)
    File.write('./mechanics.txt', mechanics_json)
  end


end
