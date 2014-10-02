ActiveRecord::Base.establish_connection({
	adapter: 'postgresql',
	host: 'localhost',
	username: 'eric',
	database: 'books'
	})

ActiveRecord::Base.logger = Logger.new(STDOUT)