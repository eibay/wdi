require 'active_record'
require_relative './bill'

class Senator < ActiveRecord::Base
	def bills
		Bill.where(sponsor_id: bioguide_id)
	end
end