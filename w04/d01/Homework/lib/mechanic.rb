require 'json'

class Mechanic
 def self.list()
  JSON.parse(File.read("./mechanic.txt"))
end

def self.hashlist(mechanic)
mechanics = self.list()
mechanics << mechanic
File.write("./mechanic.txt", mechanics.to_json)
end

def self.find_by(k,v)
  mechanics = self.list()
 mechanics.find_all do |x|
  x[k]==v
  end
end

def self.search_mechanic(params)
if params["name"] != nil
    search = params["name"].downcase
    searchingfor = params["word"].downcase
    results = Mechanic.find_by(search, searchingfor)
  elsif params["fav"] != nil
    search = params["fav"].downcase     
    searchingfor = params["word"].downcase
    results = Mechanic.find_by(search, searchingfor)
  end
end
end
