require_relative "./connection.rb"

class Number < ActiveRecord::Base

end

random_numbers = []
30.times do 
	random_numbers << Random.rand(100)
end

random_numbers.each do |x|
	y = Number.count
	if y < 31
		number = Number.new(num: x)
		number.save
	else
		puts "Table full."
	end

end