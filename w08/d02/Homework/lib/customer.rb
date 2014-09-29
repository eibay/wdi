require 'active_record'

class Customer < ActiveRecord::Base
  def tshirts
    Tshirt.where({cust_id: self.id})
  end
end