class Senator < ActiveRecord::Base
  def bills
    Bill.where(senator_bioguide_id: self.bioguide_id)
  end
end