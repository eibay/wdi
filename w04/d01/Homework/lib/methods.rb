require 'json'
require 'pry'
require 'sinatra'
require 'sinatra/reloader'

class Mech
	def self.parse()
		return JSON.parse(File.read('./mech.txt'))
	end

	def self.add(mech)
		mechs = self.parse()
		mechs.push(mech)
		File.write('./mech.txt', mechs.to_json)
	end

	def self.find_by(key, value)
    self.parse().find_all do |mech|
      mech[key].downcase == value.downcase
    end
  	end
end

class Car
	def self.parse()
		return JSON.parse(File.read('./cars.txt'))
	end

	def self.add(car)
		cars = self.parse()
		cars.push(car)
		File.write('./cars.txt', cars.to_json)
	end
	def self.find_by(key, value)
    self.parse().find_all do |car|
      car[key].downcase == value.downcase
  	end	
      
      
    end

end



