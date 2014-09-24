require 'active_record'

ActiveRecord::Base.establish_connection({
  :adapter => "postgresql",
  :host => "localhost",
  :username => "joebiggica",
  :database => "tshirtly"
})

ActiveRecord::Base.logger = Logger.new(STDOUT)

class Shirt < ActiveRecord::Base
	def orders
		return Order.where(shirt_id: self.id)
	end
end

class Order < ActiveRecord::Base
	def shirt
		return Shirt.find_by(id: self.shirt_id)
	end 
end
