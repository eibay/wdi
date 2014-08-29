require 'json'
require 'securerandom'

class Author 	

	# the init # 

	attr_accessor :name, :email 
	attr_reader :id 

	def initialize name, email, id=SecureRandom.hex 
		@name = name 
		@email = email 
		@id = id 
	end


	# class methods # 

	def self.db 
		"./authors.db"
	end   

	def self.db_hashes 
		f = File.read Author.db 
		JSON.parse f
	end 

	def self.all
		Author.db_hashes.map &:to_author 
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
		authors = Author.db_hashes
		authors << self.to_hash
		File.write Author.db, authors.to_json 
	end 

	def posts 
		Post.find_all_by :author_id, self.id 
	end 

	def post subj, content  
		Post.new subj, content, self.id 
	end 

end 


# for reading from db # 

class Hash 
	def to_author 
		Author.new self["name"], self["email"], self["id"]
	end 
end 