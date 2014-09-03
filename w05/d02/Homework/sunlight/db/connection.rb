require 'active_record'
require 'pry'

ActiveRecord::Base.establish_connection({
	:adapter => "postgresql",
	:host => "localhost",
	:username => "alexfong",
	:database => "sunshine"
	})

ActiveRecord::Base.logger = Logger.new(STDOUT)