require 'active_record'

numbers= Number.all.order(number: :desc)

numbers.each do |number|
	number.isPrime
end