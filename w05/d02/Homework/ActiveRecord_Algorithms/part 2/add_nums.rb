require 'active_record'

if 
	Number.all.length > 0 
	puts "Thats number is already in the db!"

else
	30.times do	
		random_number= Number.new
		random_number = rand(100)
		random_number.save
	end
	
end