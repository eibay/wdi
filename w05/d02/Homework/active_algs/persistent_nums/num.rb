require "active_record"
require_relative "./connection"

class Num < ActiveRecord::Base

	def self.database_exists
		raise "ERROR: Database is not empty."
	end

	def isPrime
	half = self.value / 2
	prime = true
	while prime && half > 1
		prime = false if self.value % half == 0
		half -= 1
	end
	prime
end

end