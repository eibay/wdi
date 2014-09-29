ActiveRecord::Base.establish_connection ({
	adapter: 'postgresql',
	host: 'localhost',
	username: 'eric',
	database: 'tshirtly'
	})

ActiveRecord::Base.logger = Logger.new(STDOUT);