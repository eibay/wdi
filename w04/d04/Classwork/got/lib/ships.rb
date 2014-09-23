require 'json'
require 'securerandom'

class Ship 

	attr_accessor :name, :img_url, :description 
	attr_reader :id 

	def initialize name, img_url, description, id=SecureRandom.hex 
		@name = name 
		@img_url = img_url 
		@description = description
		@id = id
	end

	def to_hash
		{"name" => self.name, 
			"img_url" => self.img_url,
			"description" => self.description,  
			"id" => self.id} 
	end 

	def to_h 
		self.to_hash
	end 

	def to_json 
		self.to_h.to_json
	end 

	def self.all 
		f = File.read "./ship.db"
		ship_arr = JSON.parse f
		ship_arr.map &:to_ship
	end 

	def create
		f = File.read "./ship.db"
		ship_arr = JSON.parse f 
		ship_arr << self.to_hash 
		File.write "./ship.db", ship_arr.to_json 
	end 

	def self.find_by_id id
		Ship.all.find do |ship|
			ship.id == id 
		end 
	end 

	def self.find_by key, value 
		Ship.all.find do |ship|
			ship.send(key) == value  
		end 
	end 

	def self.find_all_by key, value 
		Ship.all.select do |ship|
			ship.send(key) == value 
		end 
	end
end 

class Hash 
	def to_ship  
		name, img_url, description, id = self["name"], self["img_url"], self["description"], self["id"]
		Ship.new name, img_url, description, id 
	end 
end 