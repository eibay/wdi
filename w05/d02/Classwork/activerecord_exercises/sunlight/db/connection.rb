require 'active_record'

ActiveRecord::Base.establish_connection({
	:adapter => "postgresql",
	:host => "localhost",
	:username => "crawford",
	:database => "legislate"
	})

ActiveRecord::Base.logger = Logger.new(STDOUT)

class Bill < ActiveRecord::Base
end

class Senator < ActiveRecord::Base
	
	def bills
		
		return Bill.where(sen_id: bioguide_id)
		
	end
end