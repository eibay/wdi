ActiveRecord::Base.establish_connection({
	adapter: 'postgresql',
	host: 'localhost',
	username: 'eric',
	database: 'bank'
	})

ActiveRecord::Base.logger = Logger.new(STDOUT)