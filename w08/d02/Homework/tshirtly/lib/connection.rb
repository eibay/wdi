require 'active_record'

ActiveRecord::Base.establish_connection({
	:adapter => "postgresql",
	:host => "localhost",
	:username => "brendadargan",
	:database => "tshirtly_inventory"
	})

ActiveRecord::Base.logger = Logger.new(STDOUT)