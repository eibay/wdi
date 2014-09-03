class Number < ActiveRecord::Base

	def isPrime
		return Number.where(number: % 2) != 0
	end
end