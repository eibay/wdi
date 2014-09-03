require_relative './number'
require 'pry'

if Number.all.length > 0
	ActiveRecord::Base.connection.close
	puts "ERROR! This table already has exsisting data"
else
	
	num = [*1..1000]

	rand_num = num.shuffle.pop(30)

	rand_num.each do |a|
		Number.create(num: a)
	end 
end 
