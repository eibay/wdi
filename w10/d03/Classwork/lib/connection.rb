require "active_record"

ActiveRecord::Base.establish_connection({
	:adapter => "postgresql",
	:host => "localhost",
	:username => "Trish",
	:database => "photog_app"
	})

ActiveRecord::Base.logger = Logger.new(STDOUT)