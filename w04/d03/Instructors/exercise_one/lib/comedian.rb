require 'json'
require 'sinatra/reloader'

class Comedian
	def self.all()
		return JSON.parse(File.read('comedian.txt'))
	end

	def self.create(comedian)
		comedians = Comedian.all()
		comedians << comedian
		comedians_json = JSON.generate(comedians)
		File.write('comedian.txt', comedians_json)
	end	

	def initialize(name, age, joke)
		@name = name
		@age = age
		@joke = joke
	end

	def self.question
		puts "Whats your name?"
		@name_ = gets.chomp
		puts "How old are you?"
		@age_ = gets.chomp
		puts "Whats your joke?"
		@joke_ = gets.chomp
		
		comedians = []
		comedian = Comedian.new(@name_, @age_, @joke_)
		Comedian.create(comedian)
		puts "I am #{@name_}, a #{@age_} year old. My joke is #{@joke_}"
	end
end