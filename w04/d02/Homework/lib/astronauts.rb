require 'securerandom'
require 'json'

class Astronaut   
	attr_accessor :name, :rank
	attr_reader :id

	def initialize name, rank, id=SecureRandom.hex  
		@name = name  
		@rank = rank  
		@id = id 
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
		{"name" => self.name, "rank" => self.rank, "id" => self.id} 
	end 

	def find_by key, value 
		astronauts = Astronaut.all.map(&:to_h)
		results = astronauts.find do |astronaut|
			astronaut[key] == value 
		end 
		results.map(&:to_astronaut)
	end 

	def find_all_by key, value
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
		Astronaut.new(self["name"], self["rank"], self["id"]) 
	end 
endg