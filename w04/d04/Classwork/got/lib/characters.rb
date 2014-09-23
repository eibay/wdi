require 'json'
require 'securerandom'

class Character 

	attr_accessor :name, :img_url, :ship_id, :description  
	attr_reader :id # id should never change 

	# assign id to a 32 digit hex val if new 
	# else read id from db 
	def initialize name, img_url, ship_id, description, id=SecureRandom.hex 
		@name = name 
		@img_url = img_url 
		@ship_id = ship_id # foreign key 
		@description = description 
		@id = id
	end

	def to_hash
		{"name" => self.name, 
			"img_url" => self.img_url, 
			"ship_id" => self.ship_id, 
			"description" => self.description,
			"id" => self.id} 
	end 

	# alias for to_hash 
	def to_h 
		self.to_hash
	end 

	# in case needed for some reason 
	def to_json 
		self.to_hash.to_json
	end 

	# return an arr of Character obj 
	def self.all 
		f = File.read "./characters.db"
		char_arr = JSON.parse f
		char_arr.map &:to_character
	end 

	# creates a db entry for a Character obj
	def create
		f = File.read "./characters.db"
		char_arr = JSON.parse f 
		char_arr << self.to_hash 
		File.write "./characters.db", char_arr.to_json 
	end 

=begin 
Thought while writing this improved version of create, 
if I could insure the last char was always ], 
perhaps could open file in append mode, 
move up the length of one ], 
write str json hash + ] 
close file... Is reading required for this? 

(The old version would call Whatever.all, 
which would transform the json into hashes, 
then transform each Hash 
into a Whatever obj,
but noticed it was unnecessary to do all 
this computation because 
I do not need to maniplate a Whatever obj, 
just to write a json to a db 
=end 

	def self.find_by_id id
		Character.all.find do |character|
			character.id == id 
		end 
	end 

	def self.find_by key, value 
		Character.all.find do |character|
			character.send(key) == value  
		end 
	end 

	def self.find_all_by key, value 
		Character.all.select do |character|
			character.send(key) == value 
		end 
	end
end 

# for reading Characters from db 
# returns a Character obj 
class Hash 
	def to_character 
		name, img_url, ship_id, description, id = self["name"], self["img_url"], self["ship_id"], self["description"], self["id"]
		Character.new name, img_url, ship_id, description, id 
	end 
end 