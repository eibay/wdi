require 'securerandom'
require 'json'

class Clown 
	attr_accessor :name, :can_drive, :shoe_size, :car_id 
	attr_reader :id 

	def initialize n, d, ss, i=SecureRandom.hex, ci=false #if not in car, foreign key false 
		@name = n 
		@can_drive = d 
		@shoe_size = ss 
		@id = i 
		@car_id = ci #foreign key 
	end 

	def self.all 
		f = File.read "./clown.db"
		car_data = JSON.load f
		car_data.map do |clown|
			Clown.new(clown["name"], clown["can_drive"], clown["shoe_size"], clown["id"], clown["car_id"])  
		end 
	end 

	def to_json 
		self.to_h.to_json 
	end

	def to_h 
		{"name" => self.name, "can_drive" => self.can_drive, "shoe_size" => self.shoe_size, "id" => self.id, "car_id" => self.car_id} 
	end

	def create
		clowns = Clown.all.map do |clown|
			car.to_h 
		end 
		clowns << self.to_h   
		File.write "./clown.db", clowns.to_json   
	end  
end 