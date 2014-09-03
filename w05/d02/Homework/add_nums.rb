require_relative "./connection.rb"
require "pry"

class Number < ActiveRecord::Base

end

random_numbers = []
30.times do 
	random_numbers << Random.rand(100)
end


random_numbers.map do |x|
	y = Number.all.length
	if y < 31
		# binding.pry
		number = Number.new(num: x)
		number.save
	end

end