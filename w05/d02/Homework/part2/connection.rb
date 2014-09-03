ActiveRecord::Base.establish_connection({
	:adapter => "postgresql",
	:host => "localhost",
	:username => "eric",
	:database => "number"
	})

ActiveRecord::Base.logger = Logger.new(STDOUT)