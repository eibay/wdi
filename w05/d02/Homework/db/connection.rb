require 'active_record'
require 'prime'

ActiveRecord::Base.establish_connection({
	:adapter => "postgresql",
	:host => "localhost",
	:username => "crawford",
	:database => "num"
	})

ActiveRecord::Base.logger = Logger.new(STDOUT)

class Num < ActiveRecord::Base
	def isPrime(number)
		
		Prime.number do |prime|
			puts prime
		end
	end
end

# Prime.each(100) do |prime|
# 	puts prime
# end