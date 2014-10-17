require_relative './connection.rb'

class User < ActiveRecord::Base
  has_secure_password

end
