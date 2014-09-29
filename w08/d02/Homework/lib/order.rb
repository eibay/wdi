require 'active_record'

class Order < ActiveRecord::Base
  belongs_to :shirt
end
