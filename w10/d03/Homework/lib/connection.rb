require 'active_record'

ActiveRecord::Base.establish_connection({
	:adapter => "postgresql",
	:host => "localhost",
	:username => "brendadargan",
	:database => "library_app"
	})

ActiveRecord::Base.logger = Logger.new(STDOUT)