class Bill < ActiveRecord::Base
  def senator
    Senator.find_by({bioguide_id: self.senator_bioguide_id})
  end
end