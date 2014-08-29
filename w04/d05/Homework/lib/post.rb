require 'json'
require 'securerandom'
require 'date'

class Post  

	# define a db var # 

	@@db = "./posts.db"  


	# the init # 

	attr_accessor :subject, :content   
	attr_reader  :author_id, :created_at, :id

	def initialize subj, content, author_id, created_at=Date.today, id=SecureRandom.hex 
		@subject = subj  
		@content = content  
		@author_id = author_id
		@created_at = created_at
		@id = id 
	end

	# alias to subj # 

	def keyword 
		self.subject 
	end 

	def keyword= subj 
		self.subject = subj 
	end 


	# helper methods # 

	def db_hashes 
		f = File.read @@db 
		JSON.parse f
	end 


	# class methods # 

	def self.all
		db_hashes.map &:to_post 
	end

	def self.find_all_by key, val 
		Post.all.select do |post|
			post.send(key) == val 
		end 
	end 

	def self.find_by key, val 
		Post.all.find do |post|
			post.send(key) == val 
		end 
	end

	def self.find_by_id id  
		Post.all.find do |post|
			post.send(:id) == id 
		end 
	end 


	# instance methods # 

	def to_hash 
		{"subject" => self.subject, "content" => self.content, "author_id" => self.author_id, "created_at" => self.created_at, "id" => self.id}
	end 

	def create
		db_hashes << self.to_hash
		File.write @@db, db_hashes.to_json 
	end 

	def author 
		Author.all.find_by_id self.author_id
	end 

end 


# for reading from db # 

class Hash 
	def to_post 
		Post.new self["subject"], self["content"], self["author_id"], self["created_at"], self["id"]
	end 
end 