require 'active_record'

  ActiveRecord::Base.establish_connection({
    :adapter => "postgresql",
    :host => "localhost",
    :username => "Sue",
    :database => "congress"
  })

  ActiveRecord::Base.logger = Logger.new(STDOUT)


class Senator < ActiveRecord::Base
	def bill
	  Bill.find_by({sponsor_id: self.bioguide_id})
	end
end

class Bill < ActiveRecord::Base
  def senator
    Senator.find_by({bioguide_id: self.sponsor_id })
  end
end