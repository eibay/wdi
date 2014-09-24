require 'active_record'

class Customer < ActiveRecord::Base
  def orders
    Order.where({customer_id: self.id})
  end
end