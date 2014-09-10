require_relative './number'


numbers = Number.all
numbers.each do |a|
	print a[:id].isPrime
end 
