require 'active_record'


ActiveRecord::Base.establish_connection({
  :adapter => "postgresql",
  :host => "localhost",
  :username => "JillOrtenberg",
  :database => "grocery"
})

ActiveRecord::Base.logger = Logger.new(STDOUT)