require './sighting'
require 'active_record'
require 'pry'

ActiveRecord::Base.establish_connection({
	:adapter => "postgresql",
	:host => "localhost",
	:username => "eric",
	:database => "ufos"
	})

ActiveRecord::Base.logger = Logger.new(STDOUT)

circles = Sighting.where(shape: " circle")
circles.each {|record| puts record[:shape]}

random_id = Sighting.all.sample
binding.pry

puts random_id.description

btwn_1975_2006 = Sighting.where(sighted_at: 19750101..20060101)
btwn_1975_2006.each {|record| puts record[:sighted_at]}

august_2010 = Sighting.where(sighted_at: 20100801..20100831)
august_2010.each {|record| puts record[:sighted_at]}

oldest_10 = Sighting.limit(10).order(sighted_at: :asc)
oldest_10.each {|record| puts record[:sighted_at]}