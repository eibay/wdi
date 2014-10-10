require 'active_record'

class Status < ActiveRecord::Base
		self.has_one(:child)
		self.has_one(:book)
	end