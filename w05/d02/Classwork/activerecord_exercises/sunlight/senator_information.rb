require 'active_record'
class Senator < ActiveRecord::Base
  def bill
    Bill.where({sponsor_id: self.bioguide_id})
  end
end

class Bill < ActiveRecord::Base
  def senator
    Senator.find_by({bioguide_id: self.sponsor_id})
  end
end