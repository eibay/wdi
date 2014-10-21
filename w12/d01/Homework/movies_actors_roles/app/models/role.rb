class Role < ActiveRecord::Base
  belongs_to :movie
  has_one :actor
end