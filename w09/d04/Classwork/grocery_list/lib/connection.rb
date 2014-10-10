ActiveRecord::Base.establish_connection({
	adapter: 'postgresql',
	host: 'localhost',
	username: 'eric',
	database: 'grocery_list'
	})

ActiveRecord::Base.logger = Logger.new(STDOUT)