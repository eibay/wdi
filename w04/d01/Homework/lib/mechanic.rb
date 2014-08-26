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
  results = mechanics.find_all do |x|
    x[k]==v
  end
end

end
