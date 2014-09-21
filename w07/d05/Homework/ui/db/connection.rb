require 'active_record'

ActiveRecord::Base.establish_connection({
	:adapter => "postgresql",
	:host => "localhost",
	:username => "crawford",
	:database => "hangman"
	})

ActiveRecord::Base.logger = Logger.new(STDOUT)
class Record < ActiveRecord::Base
	end
