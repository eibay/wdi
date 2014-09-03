require 'active_record'

class Senator < ActiveRecord::Base
	def bills
    Bill.find_by({sponsor_id: self.bioguide_id })
  end
end