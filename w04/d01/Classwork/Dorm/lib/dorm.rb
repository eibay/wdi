require 'json'

class Dorm
  def self.create(dorm)
    dorm = self.all()
    dorms.push(dorm)
    dorm_json = JSON.generate(dorm)
    File.write('./dorm.txt', dorm_json)
  end

  def self.find_by(key, value)
    self.all().find do |dorm|
      dorm[key] == value
    end
  end

  def self.all()
    return JSON.parse(File.read('./dorm.txt'))
  end
end