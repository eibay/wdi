require 'securerandom'
require 'json'

class Car  
	attr_accessor :color, :milage, :capacity
	attr_reader :id

	def initialize co, mi, cap, i=SecureRandom.hex  
		@color = co 
		@milage = mi 
		@capacity = cap 
		@id = i
	end 

	def ride_in clown 
		clown.car_id = self.id 
	end 

	def self.all 
		# returns an array of car instances  
		f = File.read "./car.db"
		car_data = JSON.load f
		car_data.map do |car|
			Car.new(car["color"], car["milage"], car["capacity"], car["id"])  
		end 
	end

	def to_json 
		self.to_h.to_json 
	end  

	def to_h 
		{"color" => self.color, "milage" => self.milage, "capacity" => self.capacity, "id" => self.id} 
	end 

	def create
		cars = Car.all.map do |car|
			car.to_h 
		end 
		cars << self.to_h   
		File.write "./car.db", cars.to_json   
	end 
end 