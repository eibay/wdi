require "active_record"

ActiveRecord::Base.establish_connection({
	:adapter => "postgresql",
	:host => "localhost",
	:username => "Trish",
	:database => "morning_exercises"
	})

ActiveRecord::Base.logger = Logger.new(STDOUT)