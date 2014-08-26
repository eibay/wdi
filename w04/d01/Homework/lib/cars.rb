require 'json'

class Cars
 def self.list()
  JSON.parse(File.read("./car.txt"))
end

def self.hashlist(car)
cars = self.list()
cars << car
File.write("./car.txt", cars.to_json)
end

def self.find_by(k,v)
  cars = self.list()
  results = cars.find_all do |x|
    x[k]==v
  end
end
end
