require 'active_record'

ActiveRecord::Base.establish_connection({
	:adapter => "postgresql",
	:host => "localhost",
	:username => "Sue",
	:database => "number"
})

ActiveRecord::Base.logger = Logger.new(STDOUT)


class Number < ActiveRecord::Base
	def prime(nums)
	   		nums.each do |num|
	      		return false if num == 1
	     		next if num == 2 # 2 needs to be skipped. special case
	      		i = 2  # reset for each num
	      		while i < num 
	        		return false if num % i == 0  # modulo == 0 for any number is not prime
	        		i += 1   
	      		end
	   		end
	   		true # reach here only if all the numbers are prime
		end

end