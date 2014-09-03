require 'active_record'

class Bill < ActiveRecord::Base

	  def senator
	    Senator.find_by({bioguide_id: self.sponsor_id})
	  end

end