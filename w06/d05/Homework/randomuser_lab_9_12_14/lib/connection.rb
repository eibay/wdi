ActiveRecord::Base.establish_connection({
	adapter: 'postgresql',
	host: 'localhost',
	username: 'eric',
	database: 'randomusers'
	})

ActiveRecord::Base.logger = Logger.new(STDOUT)