require 'active_record'

class User < ActiveRecord::Base
  def accounts
    Account.where({user_id: self.id})
  end
end

