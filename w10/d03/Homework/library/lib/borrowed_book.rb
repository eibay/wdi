require 'active_record'

class Borrowed_Book < ActiveRecord::Base
	def child 
		Child.find_by({id: self.child_id})
	end

	def book
		Book.find_by({id: self.book_id})
	end
end