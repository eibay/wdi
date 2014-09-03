require "active_record"

	ActiveRecord::Base.establish_connection({
		:adapter => "postgresql",
		:host => "localhost",
		:username => "Trish",
		:database => "num_database"
		})