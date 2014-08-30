require 'json'
require 'securerandom'
require 'date'


class Image

	# the init # 

	attr_accessor :src, :alt   
	attr_reader :post_id, :user_id, :date_created, :id 

	def initialize src, alt, post_id, user_id, date_created=Date.today.to_s, id=SecureRandom.hex
		# posting a new img will require 4 data points 
		# loading from db will require 6 
		@src = src 
		@alt = alt 
		@post_id = post_id
		@user_id = user_id 
		@date_created = date_created 
		@id = id 
	end


	# class methods # 

	def self.db 
		"./images.db"
	end 

	def self.db_hashes 
		f = File.read Image.db 
		JSON.parse f 
	end 

	def self.all 
		Image.db_hashes.map &:to_image 
	end

	def self.find_all_by key, val
		Image.all.select do |image|
			image.send(key) == val 
		end 
	end  

	def self.find_by key, val
		Image.all.find do |image|
			image.send(key) == val 
		end 
	end 

	def self.find_by_id id 
		Image.all.find do |image|
			image.send(:id) == id   
		end 
	end 


	# instance methods # 

	def to_hash
		{
					"src" => self.src, 
					"alt" => self.alt, 
				"post_id" => self.post_id, 
				"user_id" => self.user_id, 	
		   "date_created" => self.date_created, 
		             "id" => self.id
		}
	end 

	def to_h 
		self.to_hash # alias 
	end 

	def create 
		imgs = Image.db_hashes 
		imgs << self.to_hash 
		File.write Image.db, imgs.to_json 
	end 

	def post
		Post.find_by_id self.post_id  
	end 

	def author 
		Author.find_by_id self.user_id 
	end 

	def user
		self.author # alias 
	end 

end 

class Hash 
	def to_image 
		Image.new self["src"], self["alt"], self["post_id"], self["user_id"], self["date_created"], self["id"]
	end 
end 