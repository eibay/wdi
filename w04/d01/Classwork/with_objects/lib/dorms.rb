require 'pry'
class Dormitory

	def self.all
		return JSON.parse(File.read("./dorms.txt"))
	end

	def self.create(dorm)
	    dorms = self.all
	    dorms.push(dorm)
	    dorms_json = JSON.generate(dorms)
	    File.write('./dorms.txt', dorms_json)
  	end

  	def self.find_by(key, value)
	    self.all.find do |dorm|
	    	dorm[key] == value
		end
	end

  end

path =  File.expand_path(__FILE__)

