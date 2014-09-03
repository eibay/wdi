require 'active_record'
require 'pg'

class Senator < ActiveRecord::Base
	def bills
		Bill.where(senator_id: bioguide_id)
	end
end