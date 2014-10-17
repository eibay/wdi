require 'active_record'

ActiveRecord::Base.establish_connection({
	:adapter => "postgresql",
	:host => "localhost",
	:username => "Sue", 
	:database => "bank"
	})

ActiveRecord::Base.logger = Logger.new(STDOUT)



class User < ActiveRecord::Base
	has_many(:accounts)
end 


class Account < ActiveRecord::Base
	belongs_to(:users)
end 