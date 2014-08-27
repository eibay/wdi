require 'securerandom'
require 'json'

class Astronaut   
	attr_accessor :name, :rank, :shuttle_id
	attr_reader :id

	def initialize name, rank, shuttle_id=false, id=SecureRandom.hex    
		@name = name  
		@rank = rank  
		@id = id
		@shuttle_id = shuttle_id
	end 

	def self.all  
		f = File.read "./astronaut.db"
		astronaut_json = JSON.load f
		astronaut_json.map(&:to_astronaut)
	end

	def to_json 
		self.to_h.to_json 
	end  

	def to_h 
		{"name" => self.name, "rank" => self.rank, "id" => self.id, "shuttle_id" => self.shuttle_id} 
	end 

	def self.find_by key, value 
		astronauts = Astronaut.all.map(&:to_h)
		result = astronauts.find do |astronaut|
			astronaut[key] == value 
		end 
		result.to_astronaut 
	end 

	def self.find_all_by key, value
		astronauts = Astronaut.all.map(&:to_h)  
		results = astronauts.select do |astronaut|
			astronaut[key] == value 
		end
		results.map(&:to_astronaut)
	end 

	def create
		astronauts = Astronaut.all.map do |car|
			car.to_h
		end 
		astronauts << self.to_h
		File.write "./astronaut.db", astronauts.to_json 
	end 
end 

class Hash 
	def to_astronaut 
		Astronaut.new(self["name"], self["rank"], self["shuttle_id"], self["id"]) 
	end 
end