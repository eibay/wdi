require 'active_record'
require 'pry'


ActiveRecord::Base.establish_connection({
  :adapter => "postgresql",
  :host => "localhost",
  :username => "yoshiemuranaka",
  :database => "nums"
})

ActiveRecord::Base.logger = Logger.new(STDOUT)