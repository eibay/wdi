require 'prime'
require 'active_record'

class Number < ActiveRecord::Base

	def isPrime                                                                                                                                                                       
		if Prime.each(100).include?(self.number)                                                                                                                                                   
			puts self.number                                                                                                                                                                  
		end
	end
end