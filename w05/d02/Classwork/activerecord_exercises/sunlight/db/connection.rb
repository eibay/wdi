require 'active_record'
require 'pg'


ActiveRecord::Base.establish_connection({
  :adapter => "postgresql",
  :host => "localhost",
  :username => "shotaro",
  :database => "sunlight"
})

ActiveRecord::Base.logger = Logger.new(STDOUT)