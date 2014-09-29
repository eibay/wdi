require 'active_record'

class Shirt < ActiveRecord::Base
  has_many :orders, dependent: :destroy
end
