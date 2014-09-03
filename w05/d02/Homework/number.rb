require 'prime'
class Number < ActiveRecord::Base

	def isPrime
		 Prime.instance.prime?(self.number)
	end

end