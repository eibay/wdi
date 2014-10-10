ActiveRecord::Base.establish_connection({
	adapter: 'postgresql',
	host: 'localhost',
	username: 'eric',
	database: 'library'
})

ActiveRecord::Base.logger = Logger.new(STDOUT)