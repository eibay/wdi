require 'active_record'

ActiveRecord::Base.establish_connection({
	:adapter => "postgresql",
	:host => "localhost",
	:username => "Sue", 
	:database => "blues_names"
	})

ActiveRecord::Base.logger = Logger.new(STDOUT)