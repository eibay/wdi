require 'active_record'

class BorrowedBook < ActiveRecord::Base
  self.has_many(:books)
  self.has_many(:children)
end