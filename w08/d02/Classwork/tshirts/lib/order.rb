class Order < ActiveRecord::Base
	def ordercontents
		Ordercontent.where(order_id: self.id)
	end
end
