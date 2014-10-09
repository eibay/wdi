class BorrowedBook < ActiveRecord::Base
	has_one :child
	has_one :book
end