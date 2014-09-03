require 'active_record'

ActiveRecord::Base.establish_connection({
	:adapter => "postgresql",
	:host => "localhost",
	:username => "j9",
	:database => "senator_info"
	})

ActiveRecord::Base.logger = Logger.new(STDOUT)