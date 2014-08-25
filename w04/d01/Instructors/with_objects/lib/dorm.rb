require 'json'

class Dorm
  def self.create(dorm)
    dorms = self.all()
    dorms.push(dorm)
    dorms_json = JSON.generate(dorms)
    File.write(File.expand_path(File.dirname(__FILE__) + '/../dorms.txt'), dorms_json)
  end

  def self.find_by(key, value)
    self.all().find do |dorm|
      dorm[key] == value
    end
  end

  def self.all()
    return JSON.parse(File.read(File.expand_path(File.dirname(__FILE__) + '/../dorms.txt')))
  end
end