require 'json'
require 'httparty'

class Shuttle
  def self.create(shuttle)
    shuttles = self.all()
    shuttles.push(shuttle)
    
    
    File.write("./shuttles.txt", shuttles.to_json)
  end

  def self.all()
      return JSON.parse(File.read("./shuttles.txt"))
  end

  def self.select_by(key, value)
    self.all().select do |shuttle|
      if(key=="origin_country")||(key=="destination")||(key=="name")
      shuttle[key].downcase == value.downcase
    else
      shuttle[key]==value
    end
    end
  end
  def self.find_by(key, value)
    self.all().find do |shuttle|
      if(key=="origin_country")||(key=="destination")||(key=="name")
      shuttle[key].downcase == value.downcase
    else
      shuttle[key]==value
    end
    end
  end


end