require 'pg'
#dont need
require 'active_record'


ActiveRecord::Base.establish_connection({
  :adapter => "postgresql",
  :host => "localhost",
  :username => "DarthNeel",
  :database => "ufo_sightings"
})

ActiveRecord::Base.logger = Logger.new(STDOUT)