require 'json'

class Dorm

def self.create(dorm)
	dorms = self.all()
	dorms.push(dorm)
	dorms_json= JSON.generate(dorms)
	File.write('./dorm.txt', dorms.to_json)
end

def self.dorms(name, capacity)
	self.all().find do |x|
		x[name] == capacity
	end
end

def self.all()
    return JSON.parse(File.read('./dorm.txt'))
	end
end
