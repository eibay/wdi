require "active_record"


class Shirt < ActiveRecord::Base

	def self.get_pending_order_amounts
		orders = Order.all
		amts = {}
		orders.each do |order|
			if amts[order.shirt]
				amts[order.shirt] += order.quantity
			else
				amts[order.shirt] = order.quantity
			end
		end
		self.all.each { |shirt| amts[shirt.id] = 0 unless amts[shirt.id]}
		amts
	end

	def self.get_sold_out_shirts
		amts = self.get_pending_order_amounts
		sold_out = self.all.select do |shirt|
			amts[shirt.id] == shirt.quantity or shirt.quantity == 0
		end
		sold_out
	end

	def self.get_oversold_shirts
		amts = self.get_pending_order_amounts
		oversold = self.all.select do |shirt|
			amts[shirt.id] > shirt.quantity or shirt.quantity < 0
		end
		oversold
	end


end