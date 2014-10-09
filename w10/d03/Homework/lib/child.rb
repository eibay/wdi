require 'active_record'

class Child < ActiveRecord::Base
	self.has_many(:statuses)
	end