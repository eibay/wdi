ActiveRecord::Base.establish_connection({
	:adapter => "postgresql",
	:host => "localhost",
	:username => "eric",
	:database => "sunlight"
	})

ActiveRecord::Base.logger = Logger.new(STDOUT)