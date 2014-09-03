require 'active_record'
# require_relative './seed'
require 'pry'

ActiveRecord::Base.establish_connection({
	:adapter => "postgresql",
	:host => "localhost",
	:username => "crawford",
	:database => "ufo"
	})

ActiveRecord::Base.logger = Logger.new(STDOUT)

class Ufo < ActiveRecord::Base
end


puts "Your options are shape, random, 1975, 2010, or oldest"
puts "please enter your choice"
answer = gets.chomp.downcase
if answer == "shape"
	circles = Ufo.when({shape: " circle"})
	circles.each do |x|
		puts x["id"]
	end
elsif answer == "random"
	rando = Ufo.all.sample
	puts rando["id"]
elsif answer == "1975"
	range = Ufo.where({sighted_at: ("19750101".."20061231")})
	range.each do |x|
		puts x["id"]
	end
elsif answer == "2010"
	y2k10 = Ufo.where({sighted_at: ("20100801".."20100831")})
	y2k10.each do |x|
		puts x["id"]
	end
elsif answer == "oldest"
	oldie = Ufo.limit(10).order(sighted_at: :asc)
	oldie.each do |x|
		puts x["id"]
	end
end	