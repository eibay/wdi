require 'active_record'

class Child < ActiveRecord::Base
	# def borrowed_bookes
	# 	Borrowedbook.where({child_id: self.id})
	# end
	self.has_many(:borrowed_bookes)
end