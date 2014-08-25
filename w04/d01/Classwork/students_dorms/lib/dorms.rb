require 'json'

class Dorm
  def self.create(dorm)
    dorms = self.all()
      dorms.push(dorm)
    dorms_json = JSON.generate(dorms)
    File.write('./dorms.txt', dorms_json)
  end

  def self.find_by(name, capacity)
    self.all().find do |dorm|
      dorm[key] == value
    end
  end

  def self.all()
    return JSON.parse(File.read('./dorms.txt'))
  end
end