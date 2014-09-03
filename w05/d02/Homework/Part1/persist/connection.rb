require 'active_record'
require 'pg'

ActiveRecord::Base.establish_connection({
  :adapter => "postgresql",
  :host => "localhost",
  :username => "AdrianMLin",
  :database => "singlenumber"
})

ActiveRecord::Base.logger = Logger.new(STDOUT)