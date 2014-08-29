require 'json'
require 'securerandom'

class Author 

	# define a db var # 

	@@db = "./authors.db"  


	# the init # 

	attr_accessor :name, :email 
	attr_reader :id 

	def initialize name, email, id=SecureRandom.hex 
		@name = name 
		@email = email 
		@id = id 
	end


	# helper methods # 

	def db_hashes 
		f = File.read @@db 
		JSON.parse f
	end 


	# class methods # 

	def self.all
		db_hashes.map &:to_author 
	end

	def self.find_all_by key, val 
		Author.all.select do |author|
			author.send(key) == val 
		end 
	end 

	def self.find_by key, val 
		Author.all.find do |author|
			author.send(key) == val 
		end 
	end

	def self.find_by_id id  
		Author.all.find do |author|
			author.send(:id) == id 
		end 
	end 


	# instance methods # 

	def to_hash 
		{"name" => self.name, "email" => self.email, "id" => self.id}
	end 

	def create
		db_hashes << self.to_hash
		File.write @@db, db_hashes.to_json 
	end 

	def posts 
		Post.all.find_all_by :author_id, self.id 
	end 

end 


# for reading from db # 

class Hash 
	def to_author 
		Author.new self["name"], self["email"], self["id"]
	end 
end 