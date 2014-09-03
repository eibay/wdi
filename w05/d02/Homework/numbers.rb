require "active_record"
require "prime"
class Number < ActiveRecord::Base
  def isPrime
    self.number.prime?
  end
end