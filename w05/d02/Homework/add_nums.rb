require_relative './db/connection.rb'

if Num.all.length > 0
	puts "ERROR"
else
	30.times { Num.create(number: rand(100)) }
end
		
