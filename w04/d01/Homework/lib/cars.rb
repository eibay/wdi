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

def self.if(x,y,word)
  
  if params[x] != nil 
    search= params[x].downcase
    searchingfor = params[word].downcase
    self.find_by(search, searchingfor)
  elsif params[y] != nil
    search.downcase = params[y].downcase
    searchingfor = params[word]
    self.find_by(search, searchingfor)
  end
  end
end
