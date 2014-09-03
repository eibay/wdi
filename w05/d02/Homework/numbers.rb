require "active_record"
require "prime"
#installed gem
class Number < ActiveRecord::Base
  def isPrime
    self.number.prime?
  end
end