ActiveRecord::Base.establish_connection({
	adapter: 'postgresql',
	host: 'localhost',
	username: 'eric',
	database: 'photographer'
	})

ActiveRecord::Base.logger = Logger.new(STDOUT)