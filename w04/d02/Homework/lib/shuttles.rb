require 'securerandom'
require 'json'

# all methods w/ relevant return vals should return objs
# unless the method is used for converting an obj 
# into another form  

# adding an obj to the db is accomplished by calling
# the create method on that obj 

class Shuttle  
	attr_accessor :name, :origin_country, :destination
	attr_reader :id

	def initialize name, origin_country, destination, id=SecureRandom.hex  
		@name = name 
		@origin_country = origin_country 
		@destination = destination 
		@id = id 
	end 

	def ride_in astronaut  
		astronaut.shuttle_id = self.id 
	end 

	def self.all 
		f = File.read "./shuttle.db"
		shuttle_json = JSON.load f
		shuttle_json.map(&:to_shuttle)
	end

	def to_json 
		self.to_h.to_json 
	end  

	def to_h 
		{"name" => self.name, "origin_country" => self.origin_country, "destination" => self.destination, "id" => self.id} 
	end 

	def find_by key, value 
		shuttles = Shuttle.all.map(&:to_h)
		results = shuttles.find do |shuttle|
			shuttle[key] == value 
		end 
		results.map(&:to_shuttle)
	end 

	def find_all_by key, value
		shuttles = Shuttle.all.map(&:to_h)  
		results = shuttles.select do |shuttle|
			shuttle[key] == value 
		end
		results.map(&:to_shuttle)
	end 

	def create
		shuttles = Shuttle.all.map do |car|
			car.to_h 
		end 
		shuttles << self.to_h   
		File.write "./shuttle.db", shuttles.to_json   
	end 
end 

class Hash 
	def to_shuttle
		Shuttle.new(self["name"], self["origin_country"], self["destination"], self["id"]) 
	end 
end