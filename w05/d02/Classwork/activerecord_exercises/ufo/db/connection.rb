require 'pg'
require 'active_record'


ActiveRecord::Base.establish_connection({
  :adapter => "postgresql",
  :host => "localhost",
  :username => "yoshiemuranaka",
  :database => "ufo_sightings"
})

ActiveRecord::Base.logger = Logger.new(STDOUT)