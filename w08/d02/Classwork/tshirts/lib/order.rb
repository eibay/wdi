require 'active_record'

class Order < ActiveRecord::Base
  def customer
    Customer.find_by({id: self.customer_id})
  end
  def tshirts
    Tshirts.where({order_id: self.id})
  end

end