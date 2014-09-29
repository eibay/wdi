require 'active_record'

class Customer < ActiveRecord::Base
  def order
    Order.find_by({id: self.order_id})
  end
end