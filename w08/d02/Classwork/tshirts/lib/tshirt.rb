require 'active_record'

class Tshirt < ActiveRecord::Base
  def orders
    Tshirts.where({tshirt_id: self.id})
  end
end