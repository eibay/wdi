require 'pg'
require 'active_record'


ActiveRecord::Base.establish_connection({
  :adapter => "postgresql",
  :host => "localhost",
  :username => "DarthNeel",
  :database => "ufo_test"
})

ActiveRecord::Base.logger = Logger.new(STDOUT)