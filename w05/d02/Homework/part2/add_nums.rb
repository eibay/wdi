require 'active_record'
require_relative './number'
require_relative './connection'

if Number.all.length > 0
	puts "Error: Nummbers already in database"
else
	30.times do 
		num = Number.new
		num.number = rand(100)
		num.save
	end
end