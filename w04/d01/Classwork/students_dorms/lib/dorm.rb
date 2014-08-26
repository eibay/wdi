require "json"

class Dorm
  def self.all()
    return JSON.parse(File.read("./dorm.txt"))
  end

  def self.create(building)
    dorms = self.all()
    dorms.push(building)
    dorms_json = JSON.generate(dorms)
    File.write("./dorm.txt", dorms_json)
  end

  def self.find_by(key, value)
    self.all().find do |dorm|
      dorm[key] == value
    end 
  end
end