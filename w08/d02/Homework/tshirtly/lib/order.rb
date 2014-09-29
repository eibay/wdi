require_relative './tshirt.rb'
require_relative '../db/connection.rb'

class Order < ActiveRecord::Base

def self.show
  self.all().where(status: "pending");
end


end
