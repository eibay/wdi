require_relative './connection'
require_relative './number'
require 'pry'

numbers_array=[]


if(Number.all[0] == nil)
	puts "there are no numbers to sort through"
else

Number.all.each do |number|
	if(number.isPrime==true)
		numbers_array.push(number.number)
	end
end

numbers_array.sort

numbers_array.each do |number|
puts number
end
end