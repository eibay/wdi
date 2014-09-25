require 'active_record'

class Tshirt < ActiveRecord::Base
  def customer
    Customer.find_by({id: self.cust_id})
  end
end