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
  cars.find_all do |x|
  x[k]==v
  end
end

def self.search_cars(params) #can pass params!!!!!
  if params["make"] != nil
    search = params["make"].downcase
    searchingfor = params["word"].downcase
    results = Cars.find_by(search, searchingfor)
  elsif params["model"] != nil
    search = params["model"].downcase     
    searchingfor = params["word"].downcase
    results = Cars.find_by(search, searchingfor)
  end

  return results
end
end
