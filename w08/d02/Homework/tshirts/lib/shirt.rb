require 'active_record'

ActiveRecord::Base.establish_connection(
	:adapter => 'postgresql',
	:database => 'tshirts'
)

class Shirt < ActiveRecord::Base
  def order
    Order.find_by({id: self.order_id})
  end
end