require_relative './connection'
require_relative './number'
require 'pry'


if(Number.all[0] == nil)

	range=(1..30).to_a

	range.each do  |number|

		rand=rand(1..10000000)
		Number.create(number: rand)
	end
else
	puts "the numbers database is already full"
end
