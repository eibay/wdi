require 'active_record'

ActiveRecord::Base.establish_connection({
		:adapter => "postgresql",
		:host => "localhost",
		:username => "brendadargan",
		:database => "numbers"
		})

ActiveRecord::Base.logger = Logger.new(STDOUT)

class Number < ActiveRecord::Base

	def initialize (number)
		@number = number
	end

end






